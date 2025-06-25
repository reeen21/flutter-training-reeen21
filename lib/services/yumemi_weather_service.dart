import 'dart:convert';
import 'dart:isolate';
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

  Future<WeatherForecast> fetchWeather({
    required String city,
    required DateTime date,
  }) async {
    final request = YumemiWeatherRequest(area: city, date: date);
    final response = await Isolate.run(
      () => _yumemiWeather.syncFetchWeather(
        jsonEncode(request.toJson()),
      ),
    );
    final formattedResponse = jsonDecode(response) as Map<String, dynamic>;
    return WeatherForecast.fromJson(formattedResponse);
  }
}
