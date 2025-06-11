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

    final maxTemperature = _parseTemperature(
      weatherForecast['max_temperature'].toString(),
    );

    final minTemperature = _parseTemperature(
      weatherForecast['min_temperature'].toString(),
    );

    return WeatherForecast(
      condition: condition,
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
    );
  }

  final WeatherCondition? condition;
  final int maxTemperature;
  final int minTemperature;

  static int _parseTemperature(String temperature) {
    final parsedTemperature = int.tryParse(temperature);
    if (parsedTemperature == null) {
      throw FormatException(
        "変換エラー: '$temperature' は数値に変換できません",
      );
    }
    return parsedTemperature;
  }
}
