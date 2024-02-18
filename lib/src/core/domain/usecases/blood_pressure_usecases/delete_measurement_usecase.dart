import 'package:dartz/dartz.dart';

import '../../repositories/i_blood_pressure_repository.dart';

class DeleteMeasurementUseCase {
  final IBloodPressureRepository _pressureRepository;

  DeleteMeasurementUseCase(this._pressureRepository);

  Future<Either<Exception, bool>> call(String pk) async => _pressureRepository.deleteMeasurement(pk);
}