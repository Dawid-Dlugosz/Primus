import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/core/widgets/bottom_dialog_item.dart';
import 'package:primus/features/create_flashcard/presentation/screens/create_flashcard_page_wrapper.dart';
import '../screen/create_unit.dart';
import '../view_models/create_unit_view_model.dart';
import 'package:provider/provider.dart';

class BottomDialogAdd extends StatefulWidget {
  const BottomDialogAdd({super.key});

  @override
  State<BottomDialogAdd> createState() => _BottomDialogAddState();
}

class _BottomDialogAddState extends State<BottomDialogAdd> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CreateFlashcardPageWrapper(),
                ),
              );
            },
            child: BottomDialogItem(
              iconData: Icons.copy_rounded,
              text: AppLocalizations.of(context)!.createFlashcards,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => CreateUnitViewModel(context),
                    child: CreateUnit(),
                  ),
                ),
              );
            },
            child: BottomDialogItem(
              iconData: Icons.folder_copy,
              text: AppLocalizations.of(context)!.createUnit,
            ),
          ),
        ],
      ),
    );
  }
}
