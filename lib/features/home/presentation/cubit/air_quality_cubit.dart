import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/air_quality_entity.dart';
import '../../domain/usecases/get_air_quality.dart';

part 'air_quality_state.dart';

class AirQualityCubit extends Cubit<AirQualityState> {
  final GetAirQuality getAirQuality;

  AirQualityCubit(this.getAirQuality) : super(AirQualityInitial());

  Future<void> loadAirQuality(String state, String city) async {
    emit(AirQualityLoading());
    try {
      final data = await getAirQuality(state: state, city: city);
      emit(AirQualityLoaded(data));
    } catch (e) {
      emit(AirQualityError(e.toString()));
    }
  }
}