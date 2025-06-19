import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/action/weather_action.dart';
import 'package:flutter_training/entity/weather_condition.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/exception/app_exception.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';
import 'package:flutter_training/store/weather_store.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

@GenerateNiceMocks([MockSpec<YumemiWeatherService>()])
import 'weather_store_test.mocks.dart';

void main() {
  group('WeatherStore', () {
    late MockYumemiWeatherService mockYumemiWeatherService;
    late WeatherStore weatherStore;

    setUpAll(() {
      mockYumemiWeatherService = MockYumemiWeatherService();
      final container = ProviderContainer(
        overrides: [
          yumemiWeatherServiceProvider.overrideWith(
            (ref) => mockYumemiWeatherService,
          ),
        ],
      );
      weatherStore = container.read(weatherStoreProvider.notifier);

      // ref: https://github.com/dart-lang/mockito/issues/675
      const dummyWeatherForecast = WeatherForecast(
        condition: WeatherCondition.cloudy,
        maxTemperature: 0,
        minTemperature: 0,
      );
      provideDummy(dummyWeatherForecast);
    });

    setUp(() {
      weatherStore.state = const WeatherState();
    });

    test('天気予報の取得に成功した場合、WeatherStateのweatherForecastが更新される', () {
      const expected = WeatherForecast(
        condition: WeatherCondition.cloudy,
        maxTemperature: 20,
        minTemperature: 10,
      );

      when(
        mockYumemiWeatherService.fetchWeather(
          city: anyNamed('city'),
          date: anyNamed('date'),
        ),
      ).thenReturn(expected);

      weatherStore.dispatch(
        WeatherAction.fetchWeather(city: 'tokyo', date: DateTime.now()),
      );

      expect(weatherStore.state.weatherForecast, expected);
    });

    test('天気予報の取得に失敗した場合、WeatherStateのweatherForecastが更新されない', () {
      when(
        mockYumemiWeatherService.fetchWeather(
          city: anyNamed('city'),
          date: anyNamed('date'),
        ),
      ).thenThrow(YumemiWeatherError.unknown);

      weatherStore.dispatch(
        WeatherAction.fetchWeather(city: 'tokyo', date: DateTime.now()),
      );

      expect(weatherStore.state.weatherForecast, isNull);
    });

    test('天気予報の取得に失敗した場合、WeatherStateのerrorが更新される', () {
      when(
        mockYumemiWeatherService.fetchWeather(
          city: anyNamed('city'),
          date: anyNamed('date'),
        ),
      ).thenThrow(YumemiWeatherError.invalidParameter);

      weatherStore.dispatch(
        WeatherAction.fetchWeather(city: 'tokyo', date: DateTime.now()),
      );

      expect(weatherStore.state.error, isA<AppException>());
      when(
        mockYumemiWeatherService.fetchWeather(
          city: anyNamed('city'),
          date: anyNamed('date'),
        ),
      ).thenThrow(YumemiWeatherError.unknown);

      weatherStore.dispatch(
        WeatherAction.fetchWeather(city: 'tokyo', date: DateTime.now()),
      );

      expect(weatherStore.state.error, isA<AppException>());
    });
  });
}
