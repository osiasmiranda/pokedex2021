import 'package:flutter/material.dart';
import 'package:pokedex2021/common/models/pokemon.dart';

class DetailAppBarWidget extends StatelessWidget {
  const DetailAppBarWidget({Key? key, required this.pokemon, required this.onBack}) : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(
          Icons.chevron_left,
        ),
      ),
    );
  }
}
