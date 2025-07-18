import 'package:intl/intl.dart';

import '../../domain/entities/air_quality_entity.dart';


class AirQualityRecordModel extends AirQualityRecordEntity {
  AirQualityRecordModel({
    required super.station,
    required super.pollutantId,
    required super.avgValue,
    required super.lastUpdate,
  });

  factory AirQualityRecordModel.fromJson(Map<String, dynamic> json) {
    final dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    return AirQualityRecordModel(
      station: json['station'] ?? '',
      pollutantId: json['pollutant_id'] ?? '',
      avgValue: int.tryParse(json['avg_value'] ?? '0') ?? 0,
      lastUpdate: dateFormat.parse(json['last_update']),
    );
  }

  Map<String, dynamic> toJson() {
    final dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    return {
      'station': station,
      'pollutant_id': pollutantId,
      'avg_value': avgValue.toString(),
      'last_update': dateFormat.format(lastUpdate),
    };
  }
}