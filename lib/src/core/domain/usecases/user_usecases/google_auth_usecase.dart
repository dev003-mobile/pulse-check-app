import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../repositories/i_user_repository.dart';

class GoogleAuthUseCase {
  final IUserRepository _iUserRepository;

  GoogleAuthUseCase(this._iUserRepository);

  Future<Either<Exception, UserCredential>> call() async => _iUserRepository.googleAuth();
}