import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:primus/features/auth/presentation/pages/login_page.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';
import 'package:primus/features/user_flashcard/presentation/cubit/cubit/user_flashcard_cubit.dart';
import '../core/screens/home/home_page.dart';
import '../core/widgets/snack_bar_info.dart';
import '../features/auth/utils/firebase_error.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.maybeMap(
            created: (value) {
              context.read<UserCubit>().createUser(
                    uid: value.user.uid,
                    nickname: value.user.displayName ?? '',
                  );
            },
            authorized: (value) {
              context.read<UserFlashcardCubit>().loadFlashcardSets(
                    uid: value.user.uid,
                  );

              context.read<UserCubit>().getuser(
                  uid: value.user.uid, nickname: value.user.displayName ?? '');
            },
            error: (value) {
              final communicate = errorCodeToText(value.errorCode, context);
              snakBarInfo(text: communicate, context: context);
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            return state.maybeMap(
              authorized: (value) => const HomePage(),
              loading: (_) => const LoadingWidget(),
              orElse: () => const LoginPage(),
            );
          },
        ),
      ),
    );
  }
}
