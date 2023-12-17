import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../dialog/copy_flashcard.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({required this.ownerId, super.key});

  final String ownerId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO MAKE CUBIT TO SERACH OWNERID
          Text(
            AppLocalizations.of(context)!.author(ownerId),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          // TODO MAKE COPY FLASHCARD TO TOLEARN
          IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return CopyFlashcard(add: () {});
                },
              );
            },
            icon: const Icon(
              Icons.add,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
