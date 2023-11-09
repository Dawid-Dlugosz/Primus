import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/exception/busy_nickname.dart';
import 'package:primus/model/user.dart';
import 'package:primus/screen/start_page.dart';
import 'package:primus/features/auth/utils/firebase_error.dart';
import 'package:primus/utils/popup.dart';

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
      await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: mailController.text.trim(),
              password: passwordController.text)
          .then((value) => {
                if (value.user?.uid != null)
                  {
                    _createUser(User(
                        nickname: nameController.text,
                        uid: value.user!.uid,
                        toLearn: null,
                        ownFlashcard: null)),
                  },
              });
      loading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const StartPage(),
        ),
      );
    } on auth.FirebaseAuthException catch (e) {
      showSnackBarError(e.code, context);
      loading = false;
      notifyListeners();
    } on BusyNickname catch (_) {
      loading = false;
      showSnackBarError(nicknameBusy, context);
      notifyListeners();
    }
  }

  void setShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  Future<void> checkNickName() async {
    if (!await _checlExistCollection()) {
      return;
    }
    var document = await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .get();

    for (var element in document.docs) {
      var user = element.data();
      if (user['nickname'] == nameController.text) {
        throw BusyNickname();
      }
    }
  }

  Future<void> _createUser(User user) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .doc(user.uid)
        .set(user.toJson());
  }

  Future<bool> _checlExistCollection() async {
    var document = await FirebaseFirestore.instance
        .collection(FirebaseCollection.users.name)
        .limit(1)
        .get();
    return document.size == 0 ? false : true;
  }
}
