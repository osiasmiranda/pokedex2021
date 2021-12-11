import 'dart:convert';

import 'package:dio/dio.dart';
import '/common/consts/api_consts.dart';
import '/common/error/failure.dart';
import '/common/models/pokemon.dart';

import './pokemon_repository.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  final Dio dio;

  PokemonRepositoryImpl({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;

      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os dados :(');
    }
  }
}
