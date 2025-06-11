import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiWeatherService {
  YumemiWeatherService([YumemiWeather? yumemiWeather])
    : _yumemiWeather = yumemiWeather ?? YumemiWeather();

  final YumemiWeather _yumemiWeather;

  String fetchWeather() {
    return _yumemiWeather.fetchThrowsWeather('tokyo');
  }
}
