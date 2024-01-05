import 'package:flutter/material.dart';
import 'package:primus/features/user/domain/entity/to_learn.dart';

class CardToLearn extends StatelessWidget {
  const CardToLearn({
    required this.toLearn,
    super.key,
  });
  final ToLearn toLearn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        child: InkWell(
          onTap: () {
            // TODO GOTO LEARN
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
