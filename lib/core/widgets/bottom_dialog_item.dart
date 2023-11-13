import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomDialogItem extends StatelessWidget {
  const BottomDialogItem(
      {required this.iconData, required this.text, super.key});
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 40,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
