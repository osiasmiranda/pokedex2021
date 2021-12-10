import 'package:flutter/material.dart';
import '/common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list}) : super(key: key);

  final List<Pokemon> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Container(),
    );
  }
}
