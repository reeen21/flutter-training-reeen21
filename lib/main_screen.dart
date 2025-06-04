import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              Spacer(),
              AspectRatio(aspectRatio: 1, child: Placeholder()),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: _TemperatureLabelContent(),
              ),
              Expanded(
                child: Column(
                  children: [SizedBox(height: 80), _FooterButtonContent()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
  const _FooterButtonContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {}, // TODO: Add close action.
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {}, // TODO: Add reload action.
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
