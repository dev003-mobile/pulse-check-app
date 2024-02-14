import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/entities/sign_in_entity.dart';
import '../../../core/domain/usecases/user_sign_in_usecase.dart';

class SignInStore {
  final UserSignInUseCase _signInUseCase;

  SignInStore(this._signInUseCase);

  late TextEditingController emailController;
  late TextEditingController passwordController;

  bool fieldsIsEmpty() => emailController.text.isEmpty || passwordController.text.isEmpty;

  Future<Either<Exception, UserCredential>> signIn(SignInEntity signIn) => _signInUseCase(signIn);
}
