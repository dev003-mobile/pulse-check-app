import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../modules/initial_module/_stores/slide_store.dart';
import '../../../domain/usecases/google_auth_usecase.dart';
import '../../../domain/usecases/user_sign_in_usecase.dart';
import '../../../domain/usecases/user_sign_up_usecase.dart';
import '../../../domain/usecases/user_sign_out_usecase.dart';
import '../../../domain/repositories/i_user_repository.dart';
import '../../../domain/usecases/user_get_update_usecase.dart';
import '../../../domain/usecases/user_is_sign_in_usecase.dart';
import '../../../external/repositories/user_repository_imp.dart';
import '../../../domain/usecases/user_get_current_id_usecase.dart';
import '../../../../modules/auth_module/_stores/sign_in_store.dart';
import '../../../../modules/auth_module/_stores/sign_up_store.dart';
import '../../../domain/usecases/user_forgot_password_usecase.dart';
import '../../../../modules/initial_module/_stores/splash_store.dart';
import '../../../domain/usecases/user_get_current_create_usecase.dart';
import '../../../external/datasources/contracts/i_user_datasource.dart';
import '../../../external/datasources/local/local_storage_datasource.dart';
import '../../../../modules/auth_module/_stores/forgot_password_store.dart';
import '../../../external/datasources/remote/user_datasource_remote_imp.dart';

class Injections {
  static void initialize() {
    final getIt = GetIt.instance;

    final GoogleSignIn googleAuth = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    getIt.registerLazySingleton<FirebaseAuth>(() => auth);
    getIt.registerLazySingleton<GoogleSignIn>(() => googleAuth);
    getIt.registerLazySingleton<FirebaseFirestore>(() => firestore);

    getIt.registerLazySingleton<LocalStorageDatasource>(() => LocalStorageDatasource());
    getIt.registerLazySingleton<IUserDatasource>(() => UserDatasourceRemoteImp(auth: getIt(), firestore: getIt(), googleSignIn: getIt(), localStorage: getIt()));
    getIt.registerLazySingleton<IUserRepository>(() => UserRepositoryImp(getIt()));
    
    getIt.registerLazySingleton<GoogleAuthUseCase>(() => GoogleAuthUseCase(getIt()));
    getIt.registerLazySingleton<UserForgotPasswordUseCase>(() => UserForgotPasswordUseCase(getIt()));
    getIt.registerLazySingleton<UserGetCurrentCreateUseCase>(() => UserGetCurrentCreateUseCase(getIt()));
    getIt.registerLazySingleton<UserGetCurrentIDUseCase>(() => UserGetCurrentIDUseCase(getIt()));
    getIt.registerLazySingleton<UserGetUpdateUseCase>(() => UserGetUpdateUseCase(getIt()));
    getIt.registerLazySingleton<UserIsSignInUseCase>(() => UserIsSignInUseCase(getIt()));
    getIt.registerLazySingleton<UserSignInUseCase>(() => UserSignInUseCase(getIt()));
    getIt.registerLazySingleton<UserSignOutUseCase>(() => UserSignOutUseCase(getIt()));
    getIt.registerLazySingleton<UserSignUpUseCase>(() => UserSignUpUseCase(getIt()));

    getIt.registerLazySingleton<PageController>(() => PageController());
    getIt.registerLazySingleton<SlideStore>(() => SlideStore(getIt()));
    getIt.registerFactory<SignUpStore>(() => SignUpStore(getIt()));
    getIt.registerFactory<SplashStore>(() => SplashStore(getIt()));
    getIt.registerFactory<SignInStore>(() => SignInStore(getIt(), getIt()));
    getIt.registerFactory<ForgotPasswordStore>(() => ForgotPasswordStore(getIt()));
  }
}
