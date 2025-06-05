import 'package:flutter_training/entity/weather_condition.dart';

class WeatherForecast {
  WeatherForecast({
    required this.condition,
    required this.maxTemperature,
    required this.minTemperature,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> weatherForecast) {
    final condition = WeatherCondition.fromNameOrNull(
      weatherForecast['weather_condition'] as String?,
    );
    final maxTemperature = weatherForecast['max_temperature'] as int;
    final minTemperature = weatherForecast['min_temperature'] as int;

    return WeatherForecast(
      condition: condition,
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
    );
  }

  final WeatherCondition? condition;
  final int? maxTemperature;
  final int? minTemperature;
}
