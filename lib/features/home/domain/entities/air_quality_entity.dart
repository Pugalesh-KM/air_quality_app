class AirQualityRecordEntity {
  final String station;
  final String pollutantId;
  final int avgValue;
  final DateTime lastUpdate;

  const AirQualityRecordEntity({
    required this.station,
    required this.pollutantId,
    required this.avgValue,
    required this.lastUpdate,
  });
}