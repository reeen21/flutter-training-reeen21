import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/exception/app_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_action.freezed.dart';

@freezed
sealed class WeatherAction with _$WeatherAction {
  const factory WeatherAction.fetchWeather({
    required String city,
    required DateTime date,
  }) = FetchWeatherAction;

  const factory WeatherAction.fetchWeatherSuccess({
    required WeatherForecast weatherForecast,
  }) = FetchWeatherSuccessAction;

  const factory WeatherAction.fetchWeatherError({
    required AppException error,
  }) = FetchWeatherErrorAction;
}
