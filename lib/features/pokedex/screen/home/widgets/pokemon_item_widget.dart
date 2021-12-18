//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex2021/common/models/pokemon.dart';
import 'package:pokedex2021/features/pokedex/screen/home/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(pokemon.name),
          Column(
            children: [
              Image.network(
                pokemon.image,
                height: 119,
                fit: BoxFit.cover,
              ),

              Column(
                children: pokemon.type.map((e) => TypeWidget(name: e)).toList(),
              ),
              // CachedNetworkImage(
              //   imageUrl: pokemon.image,
              //   height: 120,
              //   placeholder: (context, url) => const CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
              // Image(
              //   image: CachedNetworkImageProvider(pokemon.image),
              //   fit: BoxFit.cover,
              //   height: 120,
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
