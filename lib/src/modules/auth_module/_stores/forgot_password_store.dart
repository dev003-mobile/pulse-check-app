import 'package:flutter/material.dart';

import '../../../core/domain/usecases/user_usecases/user_forgot_password_usecase.dart';

class ForgotPasswordStore {
  final UserForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordStore(this._forgotPasswordUseCase);

  late TextEditingController emailController;

  bool fieldsIsEmpty() => emailController.text.isEmpty;

  bool isEmailValid() {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(emailController.text);
  }

  Future<void> forgotPassword(String email) async => _forgotPasswordUseCase(email);
}