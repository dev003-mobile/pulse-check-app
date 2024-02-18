import '../../entities/blood_pressuse_entity.dart';
import '../../repositories/i_blood_pressure_repository.dart';

class CreateMeasurementUseCase {
  final IBloodPressureRepository _pressureRepository;

  CreateMeasurementUseCase(this._pressureRepository);

  Future<BloodPressureEntity> call(BloodPressureEntity bloodPressureEntity) async => 
    await _pressureRepository.createMeasurement(bloodPressureEntity);
}