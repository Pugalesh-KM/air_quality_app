import '../entities/air_quality_entity.dart';

abstract class AirQualityRepository {
  Future<List<AirQualityRecordEntity>> getAirQuality({required String state, required String city});
}