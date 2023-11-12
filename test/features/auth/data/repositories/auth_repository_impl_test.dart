import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:primus/enum/collection.dart';
import 'package:primus/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:primus/features/auth/domain/repositories/auth_repository.dart';
import 'package:primus/features/auth/utils/firebase_error.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseFirestore extends Fake implements FirebaseFirestore {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockFirebaseAuth firebaseAuth;
  late AuthRepository repositoryImpl;
  late MockUserCredential userCredential;
  late FakeFirebaseFirestore cloudFirestore;

  setUpAll(() {
    userCredential = MockUserCredential();
    firebaseAuth = MockFirebaseAuth();

    cloudFirestore = FakeFirebaseFirestore();
    repositoryImpl = AuthRepositoryImpl(
      firebaseAuth: firebaseAuth,
      firestore: cloudFirestore,
    );
  });

  void expectFailure(
    Either<String, UserCredential> result,
    String code,
  ) {
    expect(result, Left(code));
  }

  group(
    'authRepositoryImpl',
    () {
      group(
        'create account with email and password',
        () {
          void setUpWhenFailure(String code) {
            when(
              () => firebaseAuth.createUserWithEmailAndPassword(
                email: 'email',
                password: 'password',
              ),
            ).thenThrow(
              FirebaseAuthException(code: code),
            );
          }

          Future<Either<String, UserCredential>> invokeRepoFunction() async {
            return repositoryImpl.createAccount(
              nickname: 'nickname',
              email: 'email',
              password: 'password',
            );
          }

          test(
            'Should return left with code email-already-in-use',
            () async {
              setUpWhenFailure(emailAlreadyExist);
              final result = await invokeRepoFunction();
              expectFailure(result, emailAlreadyExist);
            },
          );

          test(
            'Should return left with code invalid-email',
            () async {
              setUpWhenFailure(invalidEmail);

              final result = await invokeRepoFunction();

              expectFailure(result, invalidEmail);
            },
          );

          test(
            'Should return left with code operation-not-allowed',
            () async {
              setUpWhenFailure(operationNotAllowed);

              final result = await invokeRepoFunction();

              expectFailure(result, operationNotAllowed);

              expect(
                result,
                const Left(operationNotAllowed),
              );
            },
          );

          test(
            'Should return left with code weak-password',
            () async {
              setUpWhenFailure(weakPassword);

              final result = await invokeRepoFunction();

              expectFailure(result, weakPassword);
            },
          );

          test(
            'Should return UserCredential for correct login and password',
            () async {
              when(
                () => firebaseAuth.createUserWithEmailAndPassword(
                  email: 'email',
                  password: 'password',
                ),
              ).thenAnswer((_) async => userCredential);

              final result = await invokeRepoFunction();

              expect(
                result,
                Right(userCredential),
              );
            },
          );
        },
      );

      group(
        'login with email and password',
        () {
          void setUpWhenFailure(String code) {
            when(
              () => firebaseAuth.signInWithEmailAndPassword(
                email: 'email',
                password: 'password',
              ),
            ).thenThrow(FirebaseAuthException(code: code));
          }

          Future<Either<String, UserCredential>> invokeRepoFunction() async {
            return await repositoryImpl.logIn(
              email: 'email',
              password: 'password',
            );
          }

          test(
            'Should return left with code invalid-email',
            () async {
              setUpWhenFailure(invalidEmail);

              final result = await invokeRepoFunction();

              expectFailure(result, invalidEmail);
            },
          );

          test(
            'Should return left with code user-disabled',
            () async {
              setUpWhenFailure(userDisabled);

              final result = await invokeRepoFunction();

              expectFailure(result, userDisabled);
            },
          );

          test(
            'Should return left with code user-not-found',
            () async {
              setUpWhenFailure(userNotFound);

              final result = await invokeRepoFunction();

              expectFailure(result, userNotFound);
            },
          );

          test(
            'Should return left with code wrong-password',
            () async {
              setUpWhenFailure(wrongPassword);

              final result = await invokeRepoFunction();

              expectFailure(result, wrongPassword);
            },
          );

          test(
            'Should return UserCredential for correct email and password',
            () async {
              when(
                () => firebaseAuth.signInWithEmailAndPassword(
                  email: 'email',
                  password: 'password',
                ),
              ).thenAnswer((_) async => userCredential);

              final result = await invokeRepoFunction();

              expect(result, Right(userCredential));
            },
          );
        },
      );
      group('sign out', () {
        test(
          'should invoke sign out firease auth',
          () async {
            when(() => firebaseAuth.signOut()).thenAnswer((_) async {});
            await repositoryImpl.logOut();
            verify(() => firebaseAuth.signOut()).called(1);
          },
        );
      });

      group(
        'reset password',
        () {
          void setUpWhenFailure(String code) {
            when(
              () => firebaseAuth.sendPasswordResetEmail(
                email: 'email',
              ),
            ).thenThrow(FirebaseAuthException(code: code));
          }

          Future<Either<String, Unit>> invokeRepoFunction() async {
            return await repositoryImpl.resetPassword(
              email: 'email',
            );
          }

          void expectFailure(
            Either<String, Unit> result,
            String code,
          ) {
            expect(result, Left(code));
          }

          test(
            'should return Left with auth/missing-android-pkg-name code',
            () async {
              setUpWhenFailure(authInvalidEmail);
              final result = await invokeRepoFunction();

              expectFailure(result, authInvalidEmail);
            },
          );

          test(
            'should return Left with auth/missing-android-pkg-name code',
            () async {
              setUpWhenFailure(authMissingAndroidPKGname);
              final result = await invokeRepoFunction();

              expectFailure(result, authMissingAndroidPKGname);
            },
          );

          test(
            'should return Left with auth/missing-continue-uri code',
            () async {
              setUpWhenFailure(authMissingContinueUrid);
              final result = await invokeRepoFunction();

              expectFailure(result, authMissingContinueUrid);
            },
          );
          test(
            'should return Left with auth/missing-ios-bundle-id code',
            () async {
              setUpWhenFailure(authMissingIosBundleId);
              final result = await invokeRepoFunction();

              expectFailure(result, authMissingIosBundleId);
            },
          );

          test(
            'should return Left with auth/invalid-continue-uri code',
            () async {
              setUpWhenFailure(authInvalidContinueUri);
              final result = await invokeRepoFunction();

              expectFailure(result, authInvalidContinueUri);
            },
          );

          test(
            'should return Left with auth/unauthorized-continue-uri code',
            () async {
              setUpWhenFailure(authUnauthorizedContinueUri);
              final result = await invokeRepoFunction();

              expectFailure(result, authUnauthorizedContinueUri);
            },
          );

          test(
            'should return Left with auth/user-not-found code',
            () async {
              setUpWhenFailure(authUserNotFound);
              final result = await invokeRepoFunction();

              expectFailure(result, authUserNotFound);
            },
          );

          test(
            'should return Left with auth/user-not-found code',
            () async {
              setUpWhenFailure(authUserNotFound);
              final result = await invokeRepoFunction();

              expectFailure(result, authUserNotFound);
            },
          );

          test(
            'should return right with unit',
            () async {
              when(() => firebaseAuth.sendPasswordResetEmail(email: 'email'))
                  .thenAnswer((_) async => {});

              final result = await invokeRepoFunction();
              expect(result, const Right(unit));
            },
          );
        },
      );

      group(
        'check nickname',
        () {
          test('checkNickname should return Left if nickname is busy',
              () async {
            final collection =
                cloudFirestore.collection(FirebaseCollection.users.name);
            final doc = collection.doc('test');
            await doc.set({'nickname': 'nickname'});

            var result = await repositoryImpl.checkNickname(
              nickname: 'nickname',
            );

            // Assert the result
            expect(result, const Left(nicknameBusy));
          });

          test('checkNickname should return Right if nickname is free',
              () async {
            final collection =
                cloudFirestore.collection(FirebaseCollection.users.name);
            final doc = collection.doc('test');
            await doc.set({'nickname': 'not'});

            var result = await repositoryImpl.checkNickname(
              nickname: 'nickname',
            );

            // Assert the result
            expect(result, const Right(unit));
          });
        },
      );
    },
  );
}
