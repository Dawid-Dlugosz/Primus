import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FrontCard extends StatefulWidget {
  const FrontCard(
      {required this.word,
      required this.flip,
      required this.language,
      Key? key})
      : super(key: key);

  final String word;
  final Function flip;
  final String language;

  @override
  State<FrontCard> createState() => _FrontCardState();
}

class _FrontCardState extends State<FrontCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              AppLocalizations.of(context)!.language(widget.language),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.rotate,
              size: 20,
            ),
            onPressed: () {
              widget.flip();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 40, 5, 40),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.word,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
