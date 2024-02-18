import '../../entities/blood_pressuse_entity.dart';
import '../../repositories/i_blood_pressure_repository.dart';

class GetAllMeasurementUseCase {
  final IBloodPressureRepository _pressureRepository;

  GetAllMeasurementUseCase(this._pressureRepository);

  Future<List<BloodPressureEntity>> call() async => await _pressureRepository.getAllMeasurements();
}