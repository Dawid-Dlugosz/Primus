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
const flashcardNameBusy = 'flashcard-name-busy';
const flashcardTooShort = 'flashcard-short';
const operationNotAllowed = 'operation-not-allowed';

const authInvalidEmail = 'auth/invalid-email';
const authMissingAndroidPKGname = 'auth/missing-android-pkg-name';
const authMissingContinueUrid = 'auth/missing-continue-uri';
const authMissingIosBundleId = 'auth/missing-ios-bundle-id';
const authInvalidContinueUri = 'auth/invalid-continue-uri';
const authUnauthorizedContinueUri = 'auth/unauthorized-continue-uri';
const authUserNotFound = 'auth/user-not-found';

// TODO DODAĆ WSZYSTKIE KODY
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
    case flashcardNameBusy:
      return AppLocalizations.of(context)!.flashcardNameBusy;
    case flashcardTooShort:
      return AppLocalizations.of(context)!.flashcardShort;
    default:
      return AppLocalizations.of(context)!.invalidCredential;
  }
}
