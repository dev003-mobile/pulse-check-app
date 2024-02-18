import '../../repositories/i_blood_pressure_repository.dart';

class GetCountMeasurementUseCase {
  final IBloodPressureRepository _iBloodPressureRepository;

  GetCountMeasurementUseCase(this._iBloodPressureRepository);

  Future<int> call(String userId) async => 
    await _iBloodPressureRepository.getCountMeasurement(userId);
}