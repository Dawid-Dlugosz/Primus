import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primus/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:primus/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:primus/features/user/data/repository/user_repository_impl.dart';
import 'package:primus/features/user/presentation/cubit/cubit/user_cubit.dart';

class CustomMultiBlocProvider extends StatelessWidget {
  const CustomMultiBlocProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(
            authRepo: AuthRepositoryImpl(
              firebaseAuth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance,
            ),
            firestore: FirebaseFirestore.instance,
          ),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => UserCubit(
            repository: UserRepositoryImpl(
              firestore: FirebaseFirestore.instance,
            ),
          ),
        )
      ],
      child: child,
    );
  }
}
