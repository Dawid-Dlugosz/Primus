import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/create_flashcard/data/repository/create_flash_card_repository_impl.dart';
import 'package:primus/features/create_flashcard/presentation/create_flashcard/create_flashcard_cubit.dart';

import 'create_flashcard_page.dart';

class CreateFlashcardPageWrapper extends StatelessWidget {
  const CreateFlashcardPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFlashcardCubit(
        flashcardRepository: CreateFlashCardRepositoryImpl(
          firestore: FirebaseFirestore.instance,
          authUserId: FirebaseAuth.instance.currentUser!.uid,
        ),
      ),
      child: const CreateFlashcardPage(),
    );
  }
}
