import 'package:flutter/material.dart';

class AgainLearnFlashcard extends StatelessWidget {
  const AgainLearnFlashcard({required this.again, Key? key}) : super(key: key);

  final VoidCallback again;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'To już wszystkie słowka, czy chcesz uczyć się jeszcze raz?',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const Text(
          'TUTAJ BĘDZIE IKONA BUZKI KTÓRA SIĘ NAMYŚLA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: again,
          child: Text('Ucz się jeszcze raz'),
        ),
      ],
    );
  }
}
