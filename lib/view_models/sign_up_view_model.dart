import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:primus/enum%20/collection.dart';
import 'package:primus/exception/busy_nickname.dart';
import 'package:primus/screen/start_page.dart';
import 'package:primus/utils/firebase_auth_error.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel(this.context);

  final BuildContext context;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showPassword = false;
  bool loading = false;
  void signUp() async {
    try {
      loading = true;
      notifyListeners();
      await checkNickName();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mailController.text.trim(), password: passwordController.text).then((value) => {
            if (value.user?.uid != null)
              {
                insertNickname(value.user!.uid),
              },
          });
      loading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const StartPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(e.code);
      loading = false;
      notifyListeners();
    } on BusyNickname {
      showSnackBar(nicknameBusy);
      loading = false;
      notifyListeners();
    }
  }

  void setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void showSnackBar(String errorCode) {
    var snackBar = SnackBar(content: Text(errorCodeToText(errorCode, context)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> checkNickName() async {
    var doc = await FirebaseFirestore.instance.collection(FirebaseCollection.nickname.name).where('nick', isEqualTo: nameController.text).get();
    if (doc.docs.isNotEmpty) {
      throw BusyNickname();
    }
  }

  void insertNickname(String uid) {
    var doc = FirebaseFirestore.instance.collection(FirebaseCollection.nickname.name);
    Map<String, dynamic> json = {};
    json['nickname'] = nameController.text;
    doc.doc(uid).set(json);
  }
}
