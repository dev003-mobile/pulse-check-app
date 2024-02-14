import '../repositories/i_user_repository.dart';

class GoogleAuthUseCase {
  final IUserRepository _iUserRepository;

  GoogleAuthUseCase(this._iUserRepository);

  Future<void> call() async => _iUserRepository.googleAuth();
}