import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../cubit/auth_cubit.dart';
import 'sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  bool _showPassword = false;

  void tooglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.mailHint,
                    labelText: AppLocalizations.of(context)!.labelMail,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.mailError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.labelPassword,
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
                      return AppLocalizations.of(context)!.passwordError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().logIn(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signIn.toUpperCase(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signUp.toUpperCase(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
