import 'package:flutter/material.dart';

class TestItem extends StatelessWidget {
  const TestItem({required this.definition, Key? key}) : super(key: key);
  final String definition;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(definition),
      ),
    );
  }
}
