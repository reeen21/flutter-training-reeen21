import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/entity/weather_condition.dart';
import 'package:flutter_training/entity/weather_forecast.dart';
import 'package:flutter_training/extension/yumemi_weather_error_extension.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _service = YumemiWeatherService();
  WeatherForecast? _forecast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              AspectRatio(
                aspectRatio: 1,
                child: _forecast?.condition.svgImage ?? const Placeholder(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: _TemperatureLabelContent(
                  maxTemperature: _forecast?.maxTemperature,
                  minTemperature: _forecast?.minTemperature,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    _FooterButtonContent(
                      onCloseTapped: _closeMainScreen,
                      onReloadTapped: _updateWeatherCondition,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateWeatherCondition() {
    try {
      final newWeatherForecast = _service.fetchWeather(
        city: 'tokyo',
        date: DateTime.now(),
      );
      setState(() {
        _forecast = newWeatherForecast;
      });
    } on YumemiWeatherError catch (error) {
      _showErrorDialog(title: error.title, message: error.message);
    } on CheckedFromJsonException {
      _showErrorDialog(
        title: 'フォーマットエラー',
        message: 'フォーマットエラーが発生しました',
      );
    }
  }

  void _closeMainScreen() {
    Navigator.pop(context);
  }

  void _showErrorDialog({required String title, required String message}) {
    unawaited(
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Colors.blue,
                  ),
                  foregroundColor: WidgetStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TemperatureLabelContent extends StatelessWidget {
  const _TemperatureLabelContent({
    required int? maxTemperature,
    required int? minTemperature,
  }) : _maxTemperature = maxTemperature,
       _minTemperature = minTemperature;

  final int? _maxTemperature;
  final int? _minTemperature;

  @override
  Widget build(BuildContext context) {
    final temperatureLabelStyle = Theme.of(context).textTheme.labelLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            '${_minTemperature ?? '**'}℃',
            style: temperatureLabelStyle?.copyWith(color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            '${_maxTemperature ?? '**'}℃',
            style: temperatureLabelStyle?.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _FooterButtonContent extends StatelessWidget {
  const _FooterButtonContent({
    required VoidCallback onReloadTapped,
    required VoidCallback onCloseTapped,
  }) : _onReloadTapped = onReloadTapped,
       _onCloseTapped = onCloseTapped;

  final VoidCallback _onReloadTapped;
  final VoidCallback _onCloseTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: _onCloseTapped,
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: _onReloadTapped,
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
