import 'package:flutter/material.dart';

class GoToLearn extends StatelessWidget {
  const GoToLearn({required this.iconData, required this.text, required this.learnMode, Key? key}) : super(key: key);

  final IconData iconData;
  final String text;
  final Function learnMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            spreadRadius: -7,
            blurRadius: 16,
            color: Color.fromRGBO(0, 0, 0, 1),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.red,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {},
          child: ListTile(
            leading: Icon(iconData),
            title: Text(text),
          ),
        ),
      ),
    );
  }
}
