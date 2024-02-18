import 'package:blood_pressure_measurement/src/core/domain/repositories/i_blood_pressure_repository.dart';

class GetTotalBPMUseCase {
  final IBloodPressureRepository _bloodPressureRepository;

  GetTotalBPMUseCase(this._bloodPressureRepository);

  Future<int> call(String userId) async => 
    _bloodPressureRepository.getTotalBPM(userId);
}