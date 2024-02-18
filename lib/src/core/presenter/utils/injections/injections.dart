import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/i_user_repository.dart';
import '../../../../modules/main_module/_stores/main_store.dart';
import '../../../../modules/main_module/_stores/home_store.dart';
import '../../../domain/usecases/blood_pressure_usecases/get_count_measurement_usecase.dart';
import '../../../domain/usecases/blood_pressure_usecases/get_total_bpm_usecase.dart';
import '../../../external/datasources/local/current_date_local_datasource.dart';
import '../../../external/repositories/user_repository_imp.dart';
import '../../../../modules/main_module/_stores/profile_store.dart';
import '../../../../modules/auth_module/_stores/sign_in_store.dart';
import '../../../../modules/auth_module/_stores/sign_up_store.dart';
import '../../../../modules/initial_module/_stores/slide_store.dart';
import '../../../../modules/initial_module/_stores/splash_store.dart';
import '../../../domain/repositories/i_blood_pressure_repository.dart';
import '../../../../modules/main_module/_stores/measurement_store.dart';
import '../../../external/datasources/contracts/i_user_datasource.dart';
import '../../../domain/usecases/user_usecases/google_auth_usecase.dart';
import '../../../external/datasources/local/months_local_datasource.dart';
import '../../../domain/usecases/user_usecases/user_sign_up_usecase.dart';
import '../../../domain/usecases/user_usecases/user_sign_in_usecase.dart';
import '../../../external/repositories/blood_pressure_repository_imp.dart';
import '../../../domain/usecases/user_usecases/user_sign_out_usecase.dart';
import '../../../external/datasources/local/local_storage_datasource.dart';
import '../../../../modules/auth_module/_stores/forgot_password_store.dart';
import '../../../domain/usecases/user_usecases/user_get_update_usecase.dart';
import '../../../domain/usecases/user_usecases/user_is_sign_in_usecase.dart';
import '../../../external/datasources/remote/user_datasource_remote_imp.dart';
import '../../../domain/usecases/user_usecases/user_get_current_id_usecase.dart';
import '../../../external/datasources/contracts/i_blood_pressure_datasource.dart';
import '../../../domain/usecases/user_usecases/user_forgot_password_usecase.dart';
import '../../../domain/usecases/user_usecases/user_get_current_create_usecase.dart';
import '../../../external/datasources/remote/blood_pressure_datasource_remote_imp.dart';
import '../../../domain/usecases/blood_pressure_usecases/create_measurement_usecase.dart';
import '../../../domain/usecases/blood_pressure_usecases/delete_measurement_usecase.dart';
import '../../../domain/usecases/blood_pressure_usecases/get_all_measurement_usecase.dart';

class Injections {
  static Future<void> initialize() async {
    final getIt = GetIt.instance;

    final GoogleSignIn googleAuth = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    getIt.registerLazySingleton<FirebaseAuth>(() => auth);
    getIt.registerLazySingleton<GoogleSignIn>(() => googleAuth);
    getIt.registerLazySingleton<FirebaseFirestore>(() => firestore);

    getIt.registerLazySingleton<UserEntity>(() => const UserEntity());

    getIt.registerLazySingleton<MonthsLocalDatasource>(() => MonthsLocalDatasource());
    getIt.registerLazySingleton<LocalStorageDatasource>(() => LocalStorageDatasource());
    getIt.registerLazySingleton<CurrentDateLocalDatasource>(() => CurrentDateLocalDatasource());
    getIt.registerLazySingleton<IUserDatasource>(() => UserDatasourceRemoteImp(
      auth: getIt(), firestore: getIt(), googleSignIn: getIt(), localStorage: getIt()
    ));
    getIt.registerLazySingleton<IBloodPressureDatasource>(() => BloodPressureDatasourceRemoteImp());

    getIt.registerLazySingleton<IUserRepository>(() => UserRepositoryImp(getIt()));
    getIt.registerLazySingleton<IBloodPressureRepository>(() => BloodPressureRepositoryImp(getIt()));
    
    getIt.registerLazySingleton<GoogleAuthUseCase>(() => GoogleAuthUseCase(getIt()));
    getIt.registerLazySingleton<UserSignInUseCase>(() => UserSignInUseCase(getIt()));
    getIt.registerLazySingleton<UserSignUpUseCase>(() => UserSignUpUseCase(getIt()));
    getIt.registerLazySingleton<GetTotalBPMUseCase>(() => GetTotalBPMUseCase(getIt()));
    getIt.registerLazySingleton<UserSignOutUseCase>(() => UserSignOutUseCase(getIt()));
    getIt.registerLazySingleton<UserIsSignInUseCase>(() => UserIsSignInUseCase(getIt()));
    getIt.registerLazySingleton<UserGetUpdateUseCase>(() => UserGetUpdateUseCase(getIt()));
    getIt.registerLazySingleton<UserGetCurrentIDUseCase>(() => UserGetCurrentIDUseCase(getIt()));
    getIt.registerLazySingleton<CreateMeasurementUseCase>(() => CreateMeasurementUseCase(getIt()));
    getIt.registerLazySingleton<DeleteMeasurementUseCase>(() => DeleteMeasurementUseCase(getIt()));
    getIt.registerLazySingleton<GetAllMeasurementUseCase>(() => GetAllMeasurementUseCase(getIt()));
    getIt.registerLazySingleton<GetCountMeasurementUseCase>(() => GetCountMeasurementUseCase(getIt()));
    getIt.registerLazySingleton<UserForgotPasswordUseCase>(() => UserForgotPasswordUseCase(getIt()));
    getIt.registerLazySingleton<UserGetCurrentCreateUseCase>(() => UserGetCurrentCreateUseCase(getIt()));

    getIt.registerFactory<PageController>(() => PageController());

    getIt.registerLazySingleton<MainStore>(() => MainStore(getIt()));
    getIt.registerLazySingleton<SlideStore>(() => SlideStore(getIt()));
    getIt.registerLazySingleton<SignUpStore>(() => SignUpStore(getIt()));
    getIt.registerLazySingleton<SplashStore>(() => SplashStore(getIt()));
    getIt.registerLazySingleton<SignInStore>(() => SignInStore(getIt(), getIt()));
    getIt.registerLazySingleton<HomeStore>(() => HomeStore(getIt(), getIt()));
    getIt.registerLazySingleton<ForgotPasswordStore>(() => ForgotPasswordStore(getIt()));
    getIt.registerLazySingleton<MeasurementStore>(() => MeasurementStore(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<ProfileStore>(() => ProfileStore(getIt(), getIt(), getIt(), getIt(), getIt()));
  }
}