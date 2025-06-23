import 'package:flutter_training/action/weather_action.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/error/app_error.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_store.freezed.dart';
part 'weather_store.g.dart';

@freezed
sealed class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(null) WeatherForecast? weatherForecast,
    @Default(null) AppError? error,
  }) = _WeatherState;
}

@riverpod
final class WeatherStore extends _$WeatherStore {
  @override
  WeatherState build() => const WeatherState();

  void dispatch(WeatherAction action) {
    switch (action) {
      case FetchWeatherAction():
        _fetchWeather(action.city, action.date);
      case FetchWeatherSuccessAction():
        _fetchWeatherSuccess(action.weatherForecast);
      case FetchWeatherErrorAction():
        _handleAppError(action.error);
    }
  }

  void _fetchWeather(String city, DateTime date) {
    final service = ref.read(yumemiWeatherServiceProvider);
    state = state.copyWith(error: null);

    try {
      final weatherForecast = service.fetchWeather(
        city: city,
        date: date,
      );
      dispatch(
        WeatherAction.fetchWeatherSuccess(weatherForecast: weatherForecast),
      );
    } on YumemiWeatherError catch (e) {
      dispatch(WeatherAction.fetchWeatherError(error: e.toAppError()));
    } on CheckedFromJsonException catch (e) {
      dispatch(WeatherAction.fetchWeatherError(error: e.toAppError()));
    }
  }

  void _fetchWeatherSuccess(WeatherForecast weatherForecast) {
    state = state.copyWith(
      weatherForecast: weatherForecast,
      error: null,
    );
  }

  void _handleAppError(AppError error) {
    state = state.copyWith(
      error: error,
    );
  }
}
