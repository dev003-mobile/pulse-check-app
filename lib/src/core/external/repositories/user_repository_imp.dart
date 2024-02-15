import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/entities/sign_in_entity.dart';
import '../datasources/contracts/i_user_datasource.dart';
import '../../domain/repositories/i_user_repository.dart';

class UserRepositoryImp implements IUserRepository {
  final IUserDatasource _iUserDatasource;
  UserRepositoryImp(this._iUserDatasource);

  @override
  Future<void> forgotPassword(String email) async => _iUserDatasource.forgotPassword(email);

  @override
  Future<String?> getCurrentUserId() async => _iUserDatasource.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity entity) async => _iUserDatasource.getUpdateUser(entity);

  @override
  Future<Either<Exception, UserCredential>> googleAuth() async => _iUserDatasource.googleAuth();

  @override
  Future<bool> isSignIn() => _iUserDatasource.isSignIn();

  @override
  Future<Either<Exception, UserCredential>> signIn(SignInEntity signIn) async => _iUserDatasource.signIn(signIn);

  @override
  Future<void> signOut() async => _iUserDatasource.signOut();

  @override
  Future<Either<Exception, UserCredential>> signUp(UserEntity signUp) async => _iUserDatasource.signUp(signUp);
  
  @override
  Future<void> getCreateCurrentUser(UserEntity user) async => _iUserDatasource.getCreateCurrentUser(user);
}
