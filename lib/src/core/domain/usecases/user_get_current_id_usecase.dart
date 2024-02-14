import '../repositories/i_user_repository.dart';

class UserGetCurrentIDUseCase {
  final IUserRepository _iUserRepository;

  UserGetCurrentIDUseCase(this._iUserRepository);

  Future<String?> call() async => _iUserRepository.getCurrentUserId();
}
