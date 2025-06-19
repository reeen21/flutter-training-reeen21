import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_forecast_notifier.g.dart';

@riverpod
class WeatherForecastNotifier extends _$WeatherForecastNotifier {
  @override
  WeatherForecast? build() => null;

  void fetchWeather({required String city, required DateTime date}) {
    final service = ref.read(yumemiWeatherServiceProvider);
    state = service.fetchWeather(city: city, date: date);
  }
}
