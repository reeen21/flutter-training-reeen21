import 'package:flutter_training/entity/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_forecast.freezed.dart';
part 'weather_forecast.g.dart';

@freezed
sealed class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    @JsonKey(name: 'weather_condition')
    required WeatherCondition condition,
    required int maxTemperature,
    required int minTemperature,
  }) = _WeatherForecast;

  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}
