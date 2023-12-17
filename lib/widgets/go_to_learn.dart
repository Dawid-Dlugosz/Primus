import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoToLearn extends StatelessWidget {
  const GoToLearn(
      {required this.iconData,
      required this.text,
      required this.learnMode,
      Key? key})
      : super(key: key);

  final IconData iconData;
  final String text;
  final Function learnMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondary,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            learnMode();
          },
          child: ListTile(
            leading: Icon(iconData),
            title: Text(text),
          ),
        ),
      ),
    );
  }
}
