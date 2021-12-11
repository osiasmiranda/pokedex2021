import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/common/repositories/pokemon_repository_impl.dart';
import '/features/home/container/home_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex 2k21',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepositoryImpl(
          dio: Dio(),
        ),
      ),
    );
  }
}
