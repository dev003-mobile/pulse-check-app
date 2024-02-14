import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/domain/entities/user_entity.dart';
import '../../../core/domain/usecases/user_sign_up_usecase.dart';

class SignUpStore {
  final UserSignUpUseCase _signUpUseCase;

  SignUpStore(this._signUpUseCase);

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  bool isEqualsPasswords() => passwordController.text == confirmPasswordController.text;

  bool fieldsIsEmpty() => emailController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty;
  
  bool isEmailValid() {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(emailController.text);
  }
  
  Future<Either<Exception, UserCredential>> signUp(UserEntity signUp) async => _signUpUseCase(signUp);
}