import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReverseCard extends StatelessWidget {
  const ReverseCard({
    required this.wordDefinition,
    required this.flip,
    required this.language,
    super.key,
  });

  final String wordDefinition;
  final Function flip;
  final String language;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => flip(),
      child: Card(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateY(pi),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    AppLocalizations.of(context)!.definition,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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
                    flip();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 40, 5, 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    wordDefinition,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
