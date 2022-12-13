import 'package:flutter/material.dart';
import 'package:primus/screen/test/test_item.dart';

class SpellingCard extends StatefulWidget {
  const SpellingCard({required this.word, Key? key}) : super(key: key);
  final String word;
  @override
  State<SpellingCard> createState() => _SpellingCardState();
}

class _SpellingCardState extends State<SpellingCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Słowo: ${widget.word}'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return TestItem(definition: 'Test ${index}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
