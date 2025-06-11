import 'package:yumemi_weather/yumemi_weather.dart';

extension YumemiWeatherErrorExtension on YumemiWeatherError {
  String get title {
    switch (this) {
      case YumemiWeatherError.invalidParameter:
        return 'パラメータエラー';
      case YumemiWeatherError.unknown:
        return 'エラー';
    }
  }

  String get message {
    switch (this) {
      case YumemiWeatherError.invalidParameter:
        return 'リクエストの形式に誤りがあります。';
      case YumemiWeatherError.unknown:
        return '予期せぬエラーが発生しました。再度読み込んでください。';
    }
  }
}
