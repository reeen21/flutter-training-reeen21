import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/entity/yumemi_weather_request.dart';

void main() {
  group('YumemiWeatherRequest', () {
    test('JSONにエンコードできること', () {
      final date = DateTime(2025, 6, 19);
      final request = YumemiWeatherRequest(
        area: 'tokyo',
        date: date,
      );
      final json = request.toJson();
      expect(json['area'], 'tokyo');
      expect(json['date'], date.toIso8601String());
    });
  });
}
