import 'package:flutter/material.dart';
import 'package:pokedex2021/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({Key? key, required this.isDiff, required this.pokemon}) : super(key: key);

  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isDiff ? 0.3 : 1.0,
        child: TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          tween: Tween<double>(
            begin: isDiff ? 300 : 100,
            end: isDiff ? 100 : 300,
          ),
          builder: (context, value, child) {
            return Image.network(
              pokemon.image,
              fit: BoxFit.contain,
              width: value,
              // height: 120,
              // width: 120,
              color: isDiff ? Colors.grey[800] : null,
            );
          },
        ),
      ),
    );
  }
}
