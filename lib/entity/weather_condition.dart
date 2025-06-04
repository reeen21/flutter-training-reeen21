import 'package:flutter_svg/svg.dart';

enum WeatherCondition {
  sunny,
  rainy,
  cloudy;

  static WeatherCondition? fromNameOrNull(String? name) {
    for (final value in values) {
      if (value.name == name) {
        return value;
      }
    }
    return null;
  }
}

extension WeatherConditionImage on WeatherCondition {
  SvgPicture get svgImage => switch (this) {
    WeatherCondition.sunny => SvgPicture.asset('images/Sunny.svg'),
    WeatherCondition.rainy => SvgPicture.asset('images/Rainy.svg'),
    WeatherCondition.cloudy => SvgPicture.asset('images/Cloudy.svg'),
  };
}
