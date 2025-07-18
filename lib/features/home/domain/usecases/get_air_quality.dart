import '../entities/air_quality_entity.dart';
import '../repositories/air_quality_repository.dart';

class GetAirQuality {
  final AirQualityRepository repository;

  GetAirQuality(this.repository);

  Future<List<AirQualityRecordEntity>> call({required String state, required String city}) {
    return repository.getAirQuality(state: state, city: city);
  }
}