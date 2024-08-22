import 'dart:convert';
import 'package:flutter_riverpod_api/main%20screen/models/open_weather_model.dart';
import 'package:http/http.dart';

abstract class APIService {
  String get baseUrl => 'https://api.openweathermap.org';
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  dynamic fetch(String endPoint) async {
    var response = await get(Uri.parse(url + endPoint));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw Exception(
        'Failed to load data from Weather API: ${response.statusCode}');
  }
}

class WeatherAPIService extends APIService {
  static const apiKey = '56852fc96e959df02b805e1080dcd3e2';

  @override
  String get apiUrl => '/data/2.5/weather?q=';

  Future<OpenWeatherModel> fetchWeather(String city) async {
    String endPoint = '$city&appid=$apiKey&unitxs=metric';
    Map<String, dynamic> map = await fetch(endPoint);
    return OpenWeatherModel.fromMap(map);
  }
}
