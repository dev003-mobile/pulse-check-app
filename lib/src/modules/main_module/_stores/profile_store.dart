import '../../../core/domain/usecases/user_sign_out_usecase.dart';

class ProfileStore {
  final UserSignOutUseCase _signOutUseCase;

  ProfileStore(this._signOutUseCase);

  Future<void> endSession() async => await _signOutUseCase();
}
