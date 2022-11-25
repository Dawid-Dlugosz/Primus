import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/dialog/copy_flashcard.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({required this.nickname, required this.add, Key? key}) : super(key: key);

  final String nickname;
  final VoidCallback add;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.author(nickname),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return CopyFlashcard(add: add);
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
