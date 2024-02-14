import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/sign_in_entity.dart';
import '../repositories/i_user_repository.dart';

class UserSignInUseCase {
  final IUserRepository _iUserRepository;

  UserSignInUseCase(this._iUserRepository);

  Future<Either<Exception, UserCredential>> call(SignInEntity signIn) async => _iUserRepository.signIn(signIn);
}