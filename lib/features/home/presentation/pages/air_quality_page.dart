import 'dart:developer';

import 'package:air_quality_app/shared/config/dimens.dart';
import 'package:air_quality_app/shared/cubit/theme_cubit.dart';
import 'package:air_quality_app/shared/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/air_quality_cubit.dart';

class AirQualityPage extends StatefulWidget {
  const AirQualityPage({super.key});

  @override
  State<AirQualityPage> createState() => _AirQualityPageState();
}

class _AirQualityPageState extends State<AirQualityPage> {
  final _stateController = TextEditingController(text: 'TamilNadu');
  final _cityController = TextEditingController(text: 'Thanjavur');

  @override
  void dispose() {
    _stateController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  void _loadData() {
    final state = _stateController.text.trim();
    final city = _cityController.text.trim();
    log('State: $state, City: $city');
    context.read<AirQualityCubit>().loadAirQuality(state, city);
  }

  void _toggleTheme() {
    final currentTheme = context.read<ThemeCubit>().state;
    final next = currentTheme == ThemeMode.light
        ? ThemeMode.dark
        : currentTheme == ThemeMode.dark
        ? ThemeMode.system
        : ThemeMode.light;
    context.read<ThemeCubit>().setTheme(next);
  }

  Color _getQualityColor(int value) {
    if (value == 0) return Colors.red;
    if (value <= 50) return Colors.green;
    if (value <= 100) return Colors.orange;
    return Colors.red;
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Air Quality", style: AppTextStyles.openSansBold18),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: _toggleTheme,
            tooltip: "Toggle Theme",
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Input Card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.standard_12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.standard_12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _stateController,
                    decoration: const InputDecoration(labelText: 'State'),
                  ),
                  const SizedBox(height: Dimens.standard_12),
                  TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                  const SizedBox(height: Dimens.standard_16),
                  ElevatedButton.icon(
                    onPressed: _loadData,
                    icon: const Icon(Icons.search),
                    label: const Text('Search'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: Dimens.standard_14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.standard_10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          // Data Result
          Expanded(
            child: BlocBuilder<AirQualityCubit, AirQualityState>(
              builder: (context, state) {
                if (state is AirQualityLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AirQualityLoaded) {
                  if (state.data.isEmpty) {
                    return const Center(child: Text('No data found.',));
                  }
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final record = state.data[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          vertical: Dimens.standard_8,
                          horizontal: Dimens.standard_4,
                        ),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Dimens.standard_16,
                          ),
                        ),
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(Dimens.standard_16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: Dimens.standard_22,
                                backgroundColor: _getQualityColor(
                                  record.avgValue,
                                ),
                                child: const Icon(
                                  Icons.cloud,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: Dimens.standard_16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      record.station,
                                      style: AppTextStyles.openSansBold16,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Pollutant: ${record.pollutantId}',
                                      style: AppTextStyles.openSansRegular14,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Average: ${record.avgValue} µg/m³',
                                      style: AppTextStyles.openSansRegular14
                                          .copyWith(
                                            color: _getQualityColor(
                                              record.avgValue,
                                            ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Date: ${DateFormat('dd-MM-yyyy hh:mm a').format(record.lastUpdate)}',
                                      style: AppTextStyles.openSansRegular12,

                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is AirQualityError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: AppTextStyles.openSansBold14.copyWith(
                        color: theme.colorScheme.error,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
