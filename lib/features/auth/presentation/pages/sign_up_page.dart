import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/core/screens/loading_widget.dart';
import 'package:primus/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController nicknameController;
  late final TextEditingController passwordController;
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formKey;
  bool _showPassword = false;

  @override
  void initState() {
    nicknameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    nicknameController.dispose();
    emailController.dispose();
  }

  void tooglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return state.maybeMap(
                loading: (_) => const LoadingWidget(),
                orElse: () => Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nicknameController,
                                decoration: InputDecoration(
                                  labelText:
                                      AppLocalizations.of(context)!.labelName,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(
                                      Icons.drive_file_rename_outline),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .nickNameError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.mailHint,
                                  labelText:
                                      AppLocalizations.of(context)!.labelMail,
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.mail),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .mailError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: passwordController,
                                obscureText: !_showPassword,
                                decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)!
                                        .labelPassword,
                                    border: const OutlineInputBorder(),
                                    prefixIcon: const Icon(Icons.key),
                                    suffixIcon: IconButton(
                                      icon: Icon(_showPassword
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.remove_red_eye),
                                      onPressed: tooglePassword,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .passwordError;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .signIn
                                          .toUpperCase(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        await context
                                            .read<AuthCubit>()
                                            .createAccount(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              nickname: nicknameController.text,
                                            )
                                            .then(
                                              (value) => Navigator.pop(context),
                                            );
                                      }
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .signUp
                                          .toUpperCase(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
