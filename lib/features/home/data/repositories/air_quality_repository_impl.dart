import '../../domain/entities/air_quality_entity.dart';
import '../../domain/repositories/air_quality_repository.dart';
import '../datasources/air_quality_remote_data_source.dart';

class AirQualityRepositoryImpl implements AirQualityRepository {
  final AirQualityRemoteDataSourceImpl remoteDataSource;

  AirQualityRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<AirQualityRecordEntity>> getAirQuality({required String state, required String city}) async {
    return await remoteDataSource.fetchAirQuality(state: state, city: city);
  }
}