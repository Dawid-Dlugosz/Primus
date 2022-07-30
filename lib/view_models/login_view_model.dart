import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:primus/utils/firebase_auth_error.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel(this.context) {}

  final BuildContext context;

  bool showPassword = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: mailController.text.trim(), password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.code);
    }
  }

  void setShowPassowrd() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void showSnackBar(String errorCode) {
    var snackBar = SnackBar(content: Text(errorCodeToText(errorCode, context)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
