import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_test/flutter_svg_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/entity/weather_condition.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/exception/app_exception.dart';
import 'package:flutter_training/screens/main_screen.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

@GenerateNiceMocks([MockSpec<YumemiWeatherService>()])
import 'main_screen_test.mocks.dart';

void main() {
  final mockYumemiWeatherService = MockYumemiWeatherService();

  setUpAll(() {
    const dummyWeatherForecast = WeatherForecast(
      condition: WeatherCondition.cloudy,
      maxTemperature: 0,
      minTemperature: 0,
    );
    provideDummy(dummyWeatherForecast);
  });

  Future<void> givenWeatherForecast(
    WeatherForecast forecast,
  ) async {
    when(
      mockYumemiWeatherService.fetchWeather(
        city: anyNamed('city'),
        date: anyNamed('date'),
      ),
    ).thenReturn(forecast);
  }

  Future<void> givenYumemiWeatherError(YumemiWeatherError error) async {
    when(
      mockYumemiWeatherService.fetchWeather(
        city: anyNamed('city'),
        date: anyNamed('date'),
      ),
    ).thenThrow(error);
  }

  Future<void> givenMockMainScreen(WidgetTester tester) async {
    // デフォルトではサイズが横長になっているので、縦長にする
    await tester.binding.setSurfaceSize(const Size(800, 1000));
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherServiceProvider.overrideWith(
            (ref) => mockYumemiWeatherService,
          ),
        ],
        child: const MaterialApp(
          home: MainScreen(),
        ),
      ),
    );
  }

  Future<void> whenUserReloads(WidgetTester tester) async {
    await tester.tap(find.text('Reload'));
    await tester.pump();
  }

  group('main_screen', () {
    testWidgets('天気予報が取得できている場合、晴れの天気画像が表示される', (tester) async {
      const mockForecast = WeatherForecast(
        condition: WeatherCondition.sunny,
        maxTemperature: 20,
        minTemperature: 10,
      );
      await givenWeatherForecast(mockForecast);
      await givenMockMainScreen(tester);
      await whenUserReloads(tester);
      expect(
        find.svg(WeatherCondition.sunny.svgImage.bytesLoader),
        findsOneWidget,
      );
    });

    testWidgets('天気予報が取得できている場合、曇りの天気画像が表示される', (tester) async {
      const mockForecast = WeatherForecast(
        condition: WeatherCondition.cloudy,
        maxTemperature: 20,
        minTemperature: 10,
      );
      await givenWeatherForecast(mockForecast);
      await givenMockMainScreen(tester);
      await whenUserReloads(tester);
      expect(
        find.svg(WeatherCondition.cloudy.svgImage.bytesLoader),
        findsOneWidget,
      );
    });

    testWidgets('天気予報が取得できている場合、雨の天気画像が表示される', (tester) async {
      const mockForecast = WeatherForecast(
        condition: WeatherCondition.rainy,
        maxTemperature: 20,
        minTemperature: 10,
      );
      await givenWeatherForecast(mockForecast);
      await givenMockMainScreen(tester);
      await whenUserReloads(tester);
      expect(
        find.svg(WeatherCondition.rainy.svgImage.bytesLoader),
        findsOneWidget,
      );
    });

    testWidgets('天気予報が取得できている場合、最高気温と最低気温が表示される', (tester) async {
      const expected = WeatherForecast(
        condition: WeatherCondition.cloudy,
        maxTemperature: 20,
        minTemperature: 10,
      );
      await givenWeatherForecast(expected);
      await givenMockMainScreen(tester);
      await whenUserReloads(tester);
      expect(find.text('${expected.maxTemperature}℃'), findsOneWidget);
      expect(find.text('${expected.minTemperature}℃'), findsOneWidget);
    });

    testWidgets('YumemiWeatherError.unknownが発生した場合、エラーが表示される', (tester) async {
      final expected = YumemiWeatherError.unknown.toAppException();
      await givenYumemiWeatherError(YumemiWeatherError.unknown);
      await givenMockMainScreen(tester);
      await whenUserReloads(tester);
      expect(find.text(expected.title), findsOneWidget);
      expect(find.text(expected.message), findsOneWidget);
    });

    testWidgets('YumemiWeatherError.invalidParameterが発生した場合、エラーが表示される', (
      tester,
    ) async {
      final expected = YumemiWeatherError.invalidParameter.toAppException();
      await givenYumemiWeatherError(YumemiWeatherError.invalidParameter);
      await givenMockMainScreen(tester);
      await whenUserReloads(tester);
      expect(find.text(expected.title), findsOneWidget);
      expect(find.text(expected.message), findsOneWidget);
    });
  });
}
