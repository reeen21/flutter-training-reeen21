import 'package:flutter_training/action/weather_action.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/exception/app_exception.dart';
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
    @Default(null) AppException? error,
    @Default(false) bool isLoading,
  }) = _WeatherState;
}

@riverpod
final class WeatherStore extends _$WeatherStore {
  @override
  WeatherState build() => const WeatherState();

  Future<void> dispatch(WeatherAction action) async {
    switch (action) {
      case FetchWeatherAction():
        await _fetchWeather(action.city, action.date);
      case FetchWeatherSuccessAction():
        _fetchWeatherSuccess(action.weatherForecast);
      case FetchWeatherErrorAction():
        _handleAppError(action.error);
    }
  }

  Future<void> _fetchWeather(String city, DateTime date) async {
    final service = ref.read(yumemiWeatherServiceProvider);
    state = state.copyWith(error: null, isLoading: true);
    try {
      final weatherForecast = await service.fetchWeather(
        city: city,
        date: date,
      );
      await dispatch(
        WeatherAction.fetchWeatherSuccess(weatherForecast: weatherForecast),
      );
    } on YumemiWeatherError catch (e) {
      await dispatch(
        WeatherAction.fetchWeatherError(error: e.toAppException()),
      );
    } on CheckedFromJsonException catch (e) {
      await dispatch(
        WeatherAction.fetchWeatherError(error: e.toAppException()),
      );
    }
  }

  void _fetchWeatherSuccess(WeatherForecast weatherForecast) {
    state = state.copyWith(
      weatherForecast: weatherForecast,
      error: null,
      isLoading: false,
    );
  }

  void _handleAppError(AppException error) {
    state = state.copyWith(
      error: error,
      isLoading: false,
    );
  }
}
