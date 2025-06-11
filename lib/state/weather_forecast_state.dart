import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_forecast_state.g.dart';

@riverpod
class WeatherForecastState extends _$WeatherForecastState {
  final _service = YumemiWeatherService();

  @override
  WeatherForecast? build() => null;

  void fetchWeather({required String city, required DateTime date}) {
    state = _service.fetchWeather(city: city, date: date);
  }
}
