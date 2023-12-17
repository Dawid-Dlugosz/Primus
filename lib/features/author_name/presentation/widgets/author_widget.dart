import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/features/author_name/presentation/author_name/author_name_cubit.dart';
import '../../../../dialog/copy_flashcard.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({required this.ownerId, super.key});

  final String ownerId;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<AuthorNameCubit, String>(
              builder: (context, state) {
                String name = '';
                if (state.isEmpty) {
                  name = AppLocalizations.of(context)!.unknow;
                } else {
                  name = state;
                }
                return Text(
                  AppLocalizations.of(context)!.author(name),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
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
    });
  }
}
