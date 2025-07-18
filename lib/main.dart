
import 'package:air_quality_app/core/constants/api_constants.dart';
import 'package:air_quality_app/core/network/network_services.dart';
import 'package:air_quality_app/features/home/data/repositories/air_quality_repository_impl.dart';
import 'package:air_quality_app/features/home/domain/usecases/get_air_quality.dart';
import 'package:air_quality_app/features/home/presentation/cubit/air_quality_cubit.dart';
import 'package:air_quality_app/shared/cubit/theme_cubit.dart';
import 'package:air_quality_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/home/data/datasources/air_quality_remote_data_source.dart';
import 'features/home/presentation/pages/air_quality_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final network = NetworkServices(baseUrl: ApiConstants.baseUrl);
  final dataSource = AirQualityRemoteDataSourceImpl(network: network );
  final repository = AirQualityRepositoryImpl(dataSource);
  final useCase = GetAirQuality(repository);

  runApp(MyApp(getAirQuality: useCase));
}

class MyApp extends StatelessWidget {
  final GetAirQuality getAirQuality;

  const MyApp({super.key, required this.getAirQuality});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AirQualityCubit(getAirQuality)),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Air Quality',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home: const AirQualityPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}