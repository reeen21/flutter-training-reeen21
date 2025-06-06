import 'package:flutter/material.dart';
import 'package:flutter_training/entity/weather_condition.dart';
import 'package:flutter_training/services/yumemi_weather_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _service = YumemiWeatherService();
  WeatherCondition? _condition;

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
                child: _condition?.svgImage ?? const Placeholder(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: _TemperatureLabelContent(),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    _FooterButtonContent(
                      onCloseTapped: () {}, // TODO: Add close action.
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
    final weatherConditionString = _service.fetchWeather();
    setState(() {
      _condition =
          WeatherCondition.fromNameOrNull(weatherConditionString);
    });
  }
}

class _TemperatureLabelContent extends StatelessWidget {
  const _TemperatureLabelContent();

  @override
  Widget build(BuildContext context) {
    final temperatureLabelStyle = Theme.of(context).textTheme.labelLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            '** ℃',
            style: temperatureLabelStyle?.copyWith(color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Text(
            '** ℃',
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
