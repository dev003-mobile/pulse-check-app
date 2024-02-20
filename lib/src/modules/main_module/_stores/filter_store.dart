import '../../../core/domain/entities/blood_pressuse_entity.dart';
import '../../../core/domain/entities/filter_blood_pressure_entity.dart';
import '../../../core/domain/usecases/blood_pressure_usecases/get_data_range_filter_usecase.dart';

class FilterStore {
  final GetDataRangeFilterUseCase _filterUseCase;

  FilterStore(this._filterUseCase);

  List<DateTime?> dates= [];

  Future<List<BloodPressureEntity>> getFilter(FilterBloodPressureEntity filter) async => 
    await _filterUseCase(filter);
}
