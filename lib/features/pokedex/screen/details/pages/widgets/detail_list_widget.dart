import 'package:flutter/material.dart';
import 'package:pokedex2021/common/models/pokemon.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      height: 250,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list.map((e) {
                  bool diff = e.name != pokemon.name;
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: diff ? 0.3 : 1.0,
                    child: TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                        tween: Tween<double>(
                          begin: diff ? 300 : 100,
                          end: diff ? 100 : 300,
                        ),
                        builder: (context, value, child) {
                          return Center(
                            child: Image.network(
                              e.image,
                              fit: BoxFit.contain,
                              width: value,
                              // height: 120,
                              // width: 120,
                              color: diff ? Colors.grey[800] : null,
                            ),
                          );
                        }),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
