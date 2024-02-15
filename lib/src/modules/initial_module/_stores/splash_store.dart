import '../../../core/domain/usecases/user_is_sign_in_usecase.dart';

class SplashStore {
  final UserIsSignInUseCase _isSignInUseCase;

  SplashStore(this._isSignInUseCase);

  Future<bool> isLogged() async => await _isSignInUseCase();
}