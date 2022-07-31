import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:primus/screen/home_page.dart';
import 'package:primus/screen/login_page.dart';
import 'package:primus/view_models/home_view_model.dart';
import 'package:primus/view_models/login_view_model.dart';
import 'package:primus/widgets/error_widget.dart';
import 'package:primus/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

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
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return const CustomErrorWidget();
          }
          if (snapshot.hasData) {
            return ChangeNotifierProvider<HomeViewModel>(
              create: (context) => HomeViewModel(context),
              child: const HomePage(),
            );
          }
          return ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel(context),
            child: const LoginPage(),
          );
        },
      ),
    );
  }
}
