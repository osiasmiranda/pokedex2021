import 'dart:convert';

import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final List<String> type;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.type,
  });
  String get image => 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] ?? '',
      num: json['num'] ?? '',
      name: json['name'] ?? '',
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Color? get baseColor => _color(type: type[0]);

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) => Pokemon.fromMap(json.decode(source));
}
