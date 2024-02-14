import '../entities/user_entity.dart';
import '../repositories/i_user_repository.dart';

class UserGetCurrentCreateUseCase {
  final IUserRepository _iUserRepository;

  UserGetCurrentCreateUseCase(this._iUserRepository);

  Future<void> call(UserEntity user) async => _iUserRepository.getCreateCurrentUser(user);
}
