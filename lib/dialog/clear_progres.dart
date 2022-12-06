import 'package:flutter/material.dart';

class ClearProgress extends StatelessWidget {
  const ClearProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          const Text('Czy na pewno chcesz cofnąć postęp?'),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Tak'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Nie'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
