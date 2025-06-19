import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/entity/yumemi_weather_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'yumemi_weather_service.g.dart';

@riverpod
YumemiWeatherService yumemiWeatherService(Ref ref) {
  return YumemiWeatherService();
}

class YumemiWeatherService {
  YumemiWeatherService([YumemiWeather? yumemiWeather])
    : _yumemiWeather = yumemiWeather ?? YumemiWeather();

  final YumemiWeather _yumemiWeather;

  WeatherForecast fetchWeather({required String city, required DateTime date}) {
    final request = YumemiWeatherRequest(area: city, date: date);
    final response = _yumemiWeather.fetchWeather(jsonEncode(request.toJson()));
    final formattedResponse = jsonDecode(response) as Map<String, dynamic>;
    return WeatherForecast.fromJson(formattedResponse);
  }
}
