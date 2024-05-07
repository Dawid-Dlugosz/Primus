import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:primus/custom_multi_bloc_provider.dart';
import 'screen/start_page.dart';
import 'core/utils/language_provider.dart';
import 'core/utils/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // firebaseMigrateScript();
  runApp(const MyApp());
}

// change language https://www.youtube.com/watch?v=yrbaZgMtFQs

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),
      child: Builder(
        builder: (context) => CustomMultiBlocProvider(
          child: MaterialApp(
            theme: dark,
            locale: Provider.of<LanguageProvider>(context, listen: false)
                .currentLocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('pl', ''),
            ],
            home: const SafeArea(
              child: StartPage(),
            ),
          ),
        ),
      ),
    );
  }
}
