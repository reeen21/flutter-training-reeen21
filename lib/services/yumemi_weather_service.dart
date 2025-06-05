import 'dart:convert';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiWeatherService {
  YumemiWeatherService([YumemiWeather? yumemiWeather])
    : _yumemiWeather = yumemiWeather ?? YumemiWeather();

  final YumemiWeather _yumemiWeather;

  final _jsonString = '''
   {
       "area": "tokyo",
       "date": "2020-04-01T12:00:00+09:00"
   }''';

  WeatherForecast fetchWeather() {
    final response = _yumemiWeather.fetchWeather(_jsonString);
    final formattedResponse = jsonDecode(response) as Map<String, dynamic>;
    return WeatherForecast.fromJson(formattedResponse);
  }
}
