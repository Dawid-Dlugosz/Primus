import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:primus/utils/popup.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.context);

  final BuildContext context;

  bool showPassword = false;
  bool loading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    try {
      loading = true;
      notifyListeners();
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: mailController.text.trim(), password: passwordController.text);
      loading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBarError(e.code, context);
      loading = false;
      notifyListeners();
    }
  }

  void setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
