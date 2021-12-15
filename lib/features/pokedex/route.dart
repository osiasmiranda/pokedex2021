import 'package:flutter/material.dart';
import 'package:pokedex2021/common/repositories/pokemon_repository_impl.dart';

import 'screen/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);
  final PokemonRepositoryImpl repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
              );
            },
          );
        }
      },
    );
  }
}
