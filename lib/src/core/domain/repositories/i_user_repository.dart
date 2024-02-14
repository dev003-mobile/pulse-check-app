import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';
import '../entities/sign_in_entity.dart';

abstract class IUserRepository {
  Future<void> signOut();
  Future<bool> isSignIn();
  Future<void> googleAuth();
  Future<String?> getCurrentUserId();
  Future<void> forgotPassword(String email);
  Future<void> getUpdateUser(UserEntity entity);
  Future<void> getCreateCurrentUser(UserEntity user);
  Future<Either<Exception, UserCredential>> signUp(UserEntity signUp);
  Future<Either<Exception, UserCredential>> signIn(SignInEntity signIn);
}
