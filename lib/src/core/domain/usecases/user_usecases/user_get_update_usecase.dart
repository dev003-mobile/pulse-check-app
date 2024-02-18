import '../../entities/user_entity.dart';
import '../../repositories/i_user_repository.dart';

class UserGetUpdateUseCase {
  final IUserRepository _iUserRepository;

  UserGetUpdateUseCase(this._iUserRepository);

  Future<void> call(UserEntity entity) async => _iUserRepository.getUpdateUser(entity);
}
