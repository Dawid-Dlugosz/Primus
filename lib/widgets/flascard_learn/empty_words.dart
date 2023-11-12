import 'package:flutter/material.dart';
import '../../dialog/clear_progres.dart';

class EmptyWords extends StatefulWidget {
  const EmptyWords(
      {required this.showAllWords, required this.clearProgress, Key? key})
      : super(key: key);
  final VoidCallback showAllWords;
  final VoidCallback clearProgress;

  @override
  State<EmptyWords> createState() => _EmptyWordsState();
}

class _EmptyWordsState extends State<EmptyWords> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
            'Z tego kurus umiesz już wszystkie słowa, masz kilka możliowść:'),
        ElevatedButton(
          child: const Text('1. Wyzeruj postępy kurus'),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return const ClearProgress();
              },
            ).then((value) {
              var isReset = value as bool;
              if (isReset) {
                widget.clearProgress();
              }
            });
          },
        ),
        ElevatedButton(
          child: const Text('2. Pokaż wszystkie słówka'),
          onPressed: widget.showAllWords,
        ),
        ElevatedButton(
          child: const Text('3. Przejdź do następnego kurus'),
          onPressed: Navigator.of(context).pop,
        ),
      ],
    );
  }
}
