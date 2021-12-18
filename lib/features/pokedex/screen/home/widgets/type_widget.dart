import 'package:flutter/material.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(name),
    );
  }
}
