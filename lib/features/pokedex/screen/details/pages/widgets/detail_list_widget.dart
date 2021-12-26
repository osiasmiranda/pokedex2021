import 'package:flutter/material.dart';
import 'package:pokedex2021/common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 102,
      left: 0,
      right: 0,
      height: 200,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
