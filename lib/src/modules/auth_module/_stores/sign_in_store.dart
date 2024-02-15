import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/domain/entities/sign_in_entity.dart';
import '../../../core/domain/usecases/google_auth_usecase.dart';
import '../../../core/domain/usecases/user_sign_in_usecase.dart';

class SignInStore {
  final UserSignInUseCase _signInUseCase;
  final GoogleAuthUseCase _googleAuthUseCase;

  SignInStore(this._signInUseCase, this._googleAuthUseCase);

  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool fieldsIsEmpty() => emailController.text.isEmpty || passwordController.text.isEmpty;

  Future<Either<Exception, UserCredential>> signIn(SignInEntity signIn) => _signInUseCase(signIn);
  Future<Either<Exception, UserCredential>> signInWithGoogle() => _googleAuthUseCase();
}
