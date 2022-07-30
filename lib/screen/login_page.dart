import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel lViewModel;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (_, viewModel, __) {
        lViewModel = viewModel;
        return Form(
          key: viewModel.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: viewModel.mailController,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.mailHint,
                  labelText: AppLocalizations.of(context)!.labelMail,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.mailError;
                  }
                },
              ),
              TextFormField(
                controller: viewModel.passwordController,
                obscureText: !viewModel.showPassword,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.labelPassword,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: Icon(viewModel.showPassword ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
                      onPressed: viewModel.setShowPassowrd,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.passwordError;
                  }
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.signIn();
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.signIn),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.signUp),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
