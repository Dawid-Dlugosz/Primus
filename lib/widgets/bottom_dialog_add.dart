import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/core/widgets/bottom_dialog_item.dart';
import '../features/create_flashcard/data/repository/create_flash_card_repository_impl.dart';
import '../features/create_flashcard/presentation/create_flashcard/cud_flashcard_cubit.dart';
import '../features/create_flashcard/presentation/screens/create_flashcard_page.dart';

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
                  builder: (_) => BlocProvider(
                    create: (_) => CUDFlashcardCubit(
                      flashcardRepository: FlashCardRepositoryImpl(
                        firestore: FirebaseFirestore.instance,
                        authUserId: FirebaseAuth.instance.currentUser!.uid,
                      ),
                    ),
                    child: const CreateFlashcardPage(),
                  ),
                ),
              );
            },
            child: BottomDialogItem(
              iconData: Icons.copy_rounded,
              text: AppLocalizations.of(context)!.createFlashcards,
            ),
          ),
        ],
      ),
    );
  }
}
