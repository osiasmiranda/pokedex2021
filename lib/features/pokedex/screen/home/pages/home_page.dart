import 'package:flutter/material.dart';
import 'package:pokedex2021/features/pokedex/screen/details/container/detail_container.dart';
import 'package:pokedex2021/features/pokedex/screen/home/widgets/pokemon_item_widget.dart';
import '/common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.list,
    required this.onItemTap,
  }) : super(key: key);

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 12,
          children: list
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                  ))
              .toList(),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: list.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(list[index].name),
      //       onTap: () => onItemTap(
      //         '/details',
      //         DetailArguments(name: list[index].name),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
