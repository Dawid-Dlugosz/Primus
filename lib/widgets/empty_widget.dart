import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO MAKE EMPTY SCREEN
    return Column(
      children: const [
        Text('Nic tutaj nie ma'),
        Text('To jest pusty screen'),
      ],
    );
  }
}
