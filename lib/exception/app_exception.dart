import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

abstract final class AppException {
  const AppException();
  String get title;
  String get message;
}

final class WeatherAppException extends AppException {
  const WeatherAppException(this.weatherError);
  final YumemiWeatherError weatherError;

  @override
  String get title => switch (weatherError) {
    YumemiWeatherError.invalidParameter => 'パラメータエラーが発生しました',
    YumemiWeatherError.unknown => '予期せぬエラーが発生しました',
  };

  @override
  String get message => switch (weatherError) {
    YumemiWeatherError.invalidParameter => 'リクエストの形式に誤りがあります。確認してください。',
    YumemiWeatherError.unknown => '再度読み込んでください。',
  };
}

final class FormatAppException extends AppException {
  const FormatAppException(this.formatError);
  final CheckedFromJsonException formatError;

  @override
  String get title => 'フォーマットエラー';

  @override
  String get message => '天気予報データの形式が正しくありません。データの形式を確認してください。';
}

extension YumemiWeatherErrorExtension on YumemiWeatherError {
  AppException toAppException() {
    return WeatherAppException(this);
  }
}

extension CheckedFromJsonExceptionExtension on CheckedFromJsonException {
  AppException toAppException() {
    return FormatAppException(this);
  }
}
