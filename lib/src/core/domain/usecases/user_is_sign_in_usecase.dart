import '../repositories/i_user_repository.dart';

class UserIsSignInUseCase {
  final IUserRepository _iUserRepository;

  UserIsSignInUseCase(this._iUserRepository);

  Future<bool> call() async => _iUserRepository.isSignIn();
}
