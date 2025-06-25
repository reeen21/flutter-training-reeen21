import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/entity/weather_condition.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

void main() {
  group('WeatherForecast', () {
    test('JSONからデコードできること', () {
      final json = {
        'weather_condition': 'sunny',
        'max_temperature': 20,
        'min_temperature': 10,
      };
      final weatherForecast = WeatherForecast.fromJson(json);
      expect(weatherForecast.condition, WeatherCondition.sunny);
      expect(weatherForecast.maxTemperature, 20);
      expect(weatherForecast.minTemperature, 10);
    });

    test('JSONにエンコードできること', () {
      const weatherForecast = WeatherForecast(
        condition: WeatherCondition.sunny,
        maxTemperature: 20,
        minTemperature: 10,
      );
      final json = weatherForecast.toJson();
      expect(json['weather_condition'], 'sunny');
      expect(json['max_temperature'], 20);
      expect(json['min_temperature'], 10);
    });

    test('不正なJSONからのデコードで、CheckedFromJsonExceptionが発生すること', () {
      final json = {
        'weather_condition': 'invalid',
        'max_temperature': 20,
        'min_temperature': 10,
      };
      expect(
        () => WeatherForecast.fromJson(json),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });
}
