import 'package:flutter/material.dart';
import 'package:flutter_riverpod_api/main%20screen/models/open_weather_model.dart';

@immutable
abstract class OpenWeatherState {
  const OpenWeatherState();
}

@immutable
class OpenWeatherInitialState extends OpenWeatherState {}

@immutable
class OpenWeatherLoadingState extends OpenWeatherState {}

@immutable
class OpenWeatherLoadedState extends OpenWeatherState {
  final OpenWeatherModel model;

  const OpenWeatherLoadedState({required this.model});
}

@immutable
class OpenWeatherErrorState extends OpenWeatherState {
  final String errorMessage;

  const OpenWeatherErrorState({required this.errorMessage});
}
