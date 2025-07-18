part of 'air_quality_cubit.dart';

abstract class AirQualityState extends Equatable {
  @override
  List<Object> get props => [];
}

class AirQualityInitial extends AirQualityState {}

class AirQualityLoading extends AirQualityState {}

class AirQualityLoaded extends AirQualityState {
  final List<AirQualityRecordEntity> data;
  AirQualityLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class AirQualityError extends AirQualityState {
  final String message;
  AirQualityError(this.message);

  @override
  List<Object> get props => [message];
}