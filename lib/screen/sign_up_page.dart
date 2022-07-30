import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:primus/view_models/sign_up_view_model.dart';
import 'package:primus/widgets/loadin_widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpViewModel sViewModel;

  @override
  void dispose() {
    super.dispose();
    sViewModel.passwordController.dispose();
    sViewModel.nameController.dispose();
    sViewModel.mailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SignUpViewModel>(builder: (_, viewModel, __) {
        sViewModel = viewModel;
        return !viewModel.loading
            ? Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: viewModel.nameController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.labelName,
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.drive_file_rename_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalizations.of(context)!.nickNameError;
                        }
                      },
                    ),
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
                            onPressed: viewModel.setShowPassword,
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
                            Navigator.pop(context);
                          },
                          child: Text(AppLocalizations.of(context)!.signIn),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.signUp();
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.signUp),
                        )
                      ],
                    )
                  ],
                ),
              )
            : const LoadingWidget();
      }),
    );
  }
}
