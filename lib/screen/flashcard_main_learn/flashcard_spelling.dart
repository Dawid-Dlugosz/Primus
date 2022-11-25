import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FlashcardSpelling extends StatefulWidget {
  const FlashcardSpelling({Key? key}) : super(key: key);

  @override
  State<FlashcardSpelling> createState() => _FlashcardSpellingState();
}

class _FlashcardSpellingState extends State<FlashcardSpelling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}
