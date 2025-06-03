import 'package:yumemi_weather/yumemi_weather.dart';

class YumemiWeatherService {
  final _yumemiWeather = YumemiWeather();

  String fetchWeather() {
    return _yumemiWeather.fetchSimpleWeather();
  }
}
