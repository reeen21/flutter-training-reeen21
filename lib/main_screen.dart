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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AspectRatio(aspectRatio: 1, child: Placeholder()),
              _TemperatureLabelContent(),
              Expanded(
                child: Column(
                  children: [SizedBox(height: 80), _ReloadButton()],
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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                '** ℃',
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.blue),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '** ℃',
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('Close'),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('Reload'),
            ),
          ),
        ),
      ],
    );
  }
}
