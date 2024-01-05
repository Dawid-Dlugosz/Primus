import 'package:flutter/material.dart';
import '../../dialog/clear_progres.dart';

class EmptyWords extends StatelessWidget {
  const EmptyWords({
    required this.clearProgress,
    super.key,
  });

  final VoidCallback clearProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Z tego kurus umiesz już wszystkie słowa, masz kilka możliowść:',
        ),
        ElevatedButton(
          child: Text('1. Wyzeruj postępy kurus'),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return const ClearProgress();
              },
            ).then((value) {
              var isReset = value as bool;
              if (isReset) {
                clearProgress();
              }
            });
          },
        ),
        ElevatedButton(
          child: const Text(
            '2. Przejdź do następnego kurus',
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ],
    );
  }
}
