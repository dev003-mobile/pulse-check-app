import '../../repositories/i_user_repository.dart';

class UserSignOutUseCase {
  final IUserRepository _iUserRepository;

  UserSignOutUseCase(this._iUserRepository);

  Future<void> call() async => _iUserRepository.signOut();
}