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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemTap,
                    index: list.indexOf(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
