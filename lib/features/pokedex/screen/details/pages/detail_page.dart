import 'package:flutter/material.dart';
import 'package:pokedex2021/common/models/pokemon.dart';

import 'widgets/detail_app_bar_widget.dart';
import 'widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollcontroller = ScrollController();
  bool isOntop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollcontroller.position.pixels > 27) {
              isOntop = false;
            } else if (scrollcontroller.position.pixels <= 26) {
              isOntop = true;
            }
          });

          return false;
        },
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          controller: scrollcontroller,
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOntop: isOntop,
            ),
            DetailListWidget(
              controller: widget.controller,
              pokemon: widget.pokemon,
              list: widget.list,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
