import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/screen/create_flashcard_page.dart';
import 'package:primus/view_models/create_flashcard_view_model.dart';
import 'package:provider/provider.dart';

class BottomDialogAdd extends StatefulWidget {
  const BottomDialogAdd({Key? key}) : super(key: key);

  @override
  State<BottomDialogAdd> createState() => _BottomDialogAddState();
}

class _BottomDialogAddState extends State<BottomDialogAdd> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => ChangeNotifierProvider(
                create: (context) => FlashcardViewModel(context),
                child: const CreateFlashcardPage(),
              ),
            );
          },
          child: Row(
            children: [
              const Icon(
                Icons.copy_rounded,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(AppLocalizations.of(context)!.createFlashcards),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                Icons.folder_copy,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(AppLocalizations.of(context)!.createUnit),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              const Icon(
                Icons.group,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(AppLocalizations.of(context)!.createClass),
            ],
          ),
        ),
      ],
    );
  }
}
