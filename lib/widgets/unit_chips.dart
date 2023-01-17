import 'package:flutter/material.dart';

class UnitChips extends StatelessWidget {
  const UnitChips({required this.name, required this.addFlashcard, required this.selected, Key? key}) : super(key: key);
  final String name;
  final VoidCallback addFlashcard;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: selected ? Colors.blue : Colors.grey,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name),
          selected ? const Icon(Icons.close) : Container(),
        ],
      ),
      onPressed: () => addFlashcard(),
    );
  }
}
