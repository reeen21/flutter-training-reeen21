import 'dart:convert';
import 'package:flutter_training/entity/weather_condition.dart';

class WeatherForecast {
  WeatherForecast({
    required this.condition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  final WeatherCondition? condition;
  final int maxTemperature;
  final int minTemperature;
  final DateTime date;

  static WeatherForecast fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return WeatherForecast(
      condition: WeatherCondition.fromNameOrNull(
        jsonMap['weather_condition'] as String?,
      ),
      maxTemperature: jsonMap['max_temperature'] as int,
      minTemperature: jsonMap['min_temperature'] as int,
      date: DateTime.parse(jsonMap['date'] as String),
    );
  }
}
