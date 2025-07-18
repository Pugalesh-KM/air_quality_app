import 'package:air_quality_app/core/network/network_services.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/air_quality_record.dart';

class AirQualityRemoteDataSourceImpl {
  final NetworkServices network;

  AirQualityRemoteDataSourceImpl({required this.network});

  Future<List<AirQualityRecordModel>> fetchAirQuality({required String state, required String city}) async {
    final url = ApiConstants.airQualityUrl(state: state, city: city);
    final response = await network.get(url);

    if (response.statusCode == 200) {
      final List data = response.data['records'];
      return data.map((e) => AirQualityRecordModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load air quality data');
    }
  }
}