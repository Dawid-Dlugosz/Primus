import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FrontCard extends StatelessWidget {
  const FrontCard({
    required this.word,
    required this.flip,
    required this.language,
    super.key,
  });

  final String word;
  final Function flip;
  final String language;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => flip(),
      child: Card(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  AppLocalizations.of(context)!.language(language),
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
                  flip();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 40, 5, 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  word,
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
    );
  }
}
