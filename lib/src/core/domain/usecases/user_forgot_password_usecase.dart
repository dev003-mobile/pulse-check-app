import '../repositories/i_user_repository.dart';

class UserForgotPasswordUseCase {
  final IUserRepository _iUserRepository;

  UserForgotPasswordUseCase(this._iUserRepository);

  Future<void> call(String email) async => _iUserRepository.forgotPassword(email);
}
