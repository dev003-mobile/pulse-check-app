import '../../entities/blood_pressuse_entity.dart';
import '../../entities/filter_blood_pressure_entity.dart';
import '../../repositories/i_blood_pressure_repository.dart';

class GetDataRangeFilterUseCase {
  final IBloodPressureRepository _iBloodPressureRepository;

  GetDataRangeFilterUseCase(this._iBloodPressureRepository);

  Future<List<BloodPressureEntity>> call(FilterBloodPressureEntity filter) async =>
    await _iBloodPressureRepository.getDataRangeFilter(filter);
}
