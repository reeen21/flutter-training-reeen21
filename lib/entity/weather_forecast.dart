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
}
