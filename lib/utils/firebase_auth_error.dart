import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const invalidEmail = 'invalid-email';
const userDisabled = 'user-disabled';
const userNotFound = 'user-not-found';
const wrongPassword = 'wrong-password';
const emailAlreadyExist = 'email-already-in-use';
const emailAlreadyExist2 = 'account-exists-with-different-credential';
const invalidCredential = 'invalid-credential';
const weakPassword = 'weak-password';
const nicknameBusy = 'nickname-busy';

String errorCodeToText(String errorCode, BuildContext context) {
  switch (errorCode) {
    case invalidEmail:
      return AppLocalizations.of(context)!.invalidEmail;
    case userDisabled:
      return AppLocalizations.of(context)!.userDisabled;
    case userNotFound:
      return AppLocalizations.of(context)!.userNotFount;
    case wrongPassword:
      return AppLocalizations.of(context)!.wrongPassword;
    case emailAlreadyExist:
    case emailAlreadyExist2:
      return AppLocalizations.of(context)!.emailAlreadyExist;
    case invalidCredential:
      return AppLocalizations.of(context)!.invalidCredential;
    case weakPassword:
      return AppLocalizations.of(context)!.weakPassword;
    case nicknameBusy:
      return AppLocalizations.of(context)!.nicknameBusy;
    default:
      return AppLocalizations.of(context)!.invalidCredential;
  }
}
