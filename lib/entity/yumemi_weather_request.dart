import 'package:freezed_annotation/freezed_annotation.dart';

part 'yumemi_weather_request.freezed.dart';
part 'yumemi_weather_request.g.dart';

@Freezed(toJson: true)
sealed class YumemiWeatherRequest with _$YumemiWeatherRequest {
  const factory YumemiWeatherRequest({
    required String area,
    required DateTime date,
  }) = _YumemiWeatherRequest;
}
