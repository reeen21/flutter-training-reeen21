import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

sealed class AppError {
  const AppError();
}

class WeatherAppError extends AppError {
  const WeatherAppError(this.weatherError);
  final YumemiWeatherError weatherError;
}

class UnknownAppError extends AppError {
  const UnknownAppError([this.title = 'エラー', this.message = '予期せぬエラーが発生しました。']);
  final String title;
  final String message;
}

class FormatAppError extends AppError {
  const FormatAppError(this.formatError);
  final CheckedFromJsonException formatError;
}

extension AppErrorHelper on AppError {
  String get title {
    return switch (this) {
      WeatherAppError(:final weatherError) => weatherError.title,
      UnknownAppError(:final title) => title,
      FormatAppError(:final formatError) => formatError.title
    };
  }

  String get message {
    return switch (this) {
      WeatherAppError(:final weatherError) => weatherError.message,
      UnknownAppError(:final message) => message,
      FormatAppError(:final message) => message
    };
  }
}

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

  AppError toAppError() {
    return WeatherAppError(this);
  }
}

extension CheckedFromJsonExceptionExtension on CheckedFromJsonException {
  AppError toAppError() {
    return FormatAppError(this);
  }

  String get title {
    return 'フォーマットエラー';
  }

  String get message {
    return '天気予報データの形式が正しくありません。データの形式を確認してください。';
  }
}
