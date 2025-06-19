import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/action/weather_action.dart';
import 'package:flutter_training/entity/weather_condition.dart';
import 'package:flutter_training/store/weather_store.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherStore = ref.watch(weatherStoreProvider);

    ref.listen<WeatherState>(
      weatherStoreProvider,
      (previous, next) {
        final error = next.error;
        if (error != null) {
          _showErrorDialog(
            context,
            title: error.title,
            message: error.message,
          );
        }
      },
    );

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              AspectRatio(
                aspectRatio: 1,
                child:
                    weatherStore.weatherForecast?.condition.svgImage ??
                    const Placeholder(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: _TemperatureLabelContent(
                  maxTemperature:
                      weatherStore.weatherForecast?.maxTemperature,
                  minTemperature:
                      weatherStore.weatherForecast?.minTemperature,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    _FooterButtonContent(
                      onCloseTapped: () => _closeMainScreen(context),
                      onReloadTapped: () =>
                          _updateWeatherCondition(context, ref),
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

  void _updateWeatherCondition(BuildContext context, WidgetRef ref) {
    ref
        .read(weatherStoreProvider.notifier)
        .dispatch(
          WeatherAction.fetchWeather(
            city: 'tokyo',
            date: DateTime.now(),
          )
    );
  }

  void _closeMainScreen(BuildContext context) {
    Navigator.pop(context);
  }

  void _showErrorDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) {
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
