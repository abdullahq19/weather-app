import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_api/main%20screen/models/open_weather_model.dart';
import 'package:flutter_riverpod_api/main%20screen/notifier/open_weather_notifier_states.dart';
import 'package:flutter_riverpod_api/services/api_service.dart';

final openWeatherStateNotifierProvider = StateNotifierProvider.autoDispose<
    OpenWeatherStateNotifier,
    OpenWeatherState>((ref) => OpenWeatherStateNotifier());

class OpenWeatherStateNotifier extends StateNotifier<OpenWeatherState> {
  // Constructor
  OpenWeatherStateNotifier() : super(OpenWeatherInitialState());

  final TextEditingController controller = TextEditingController();

  final WeatherAPIService _apiService = WeatherAPIService();

  static const String _errorMessage = 'Something went wrong';

  OpenWeatherModel? model;

  void fetchWeather() async {
    try {
      state = OpenWeatherLoadingState();
      model = await _apiService.fetchWeather(controller.text.isEmpty ? 'Bahawalpur' : controller.text);
      state = OpenWeatherLoadedState(model: model!);
      controller.clear();
    } catch (e) {
      state = const OpenWeatherErrorState(errorMessage: _errorMessage);
      log('Error: ${e.toString()}');
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
