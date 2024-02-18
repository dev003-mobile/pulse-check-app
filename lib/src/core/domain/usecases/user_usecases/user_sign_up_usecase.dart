import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../entities/user_entity.dart';
import '../../repositories/i_user_repository.dart';

class UserSignUpUseCase {
  final IUserRepository _iUserRepository;

  UserSignUpUseCase(this._iUserRepository);

  Future<Either<Exception, UserCredential>> call(UserEntity signUp) async => _iUserRepository.signUp(signUp);
}