import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ImageContent(size: screenSize.width / 2),
                _TemperatureLabelContent(labelWidth: screenSize.width / 4),
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: _ReloadButton(buttonWidth: screenSize.width / 4),
          ),
        ],
      ),
    );
  }
}

class _ImageContent extends StatelessWidget {
  const _ImageContent({required double size}) : _size = size;
  final double _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _size,
      height: _size,
      child: const Placeholder(),
    );
  }
}

class _TemperatureLabelContent extends StatelessWidget {
  const _TemperatureLabelContent({required double labelWidth}) : _labelWidth = labelWidth;
  final double _labelWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
  
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _labelWidth,
            child: Center(
              child: Text(
                '**℃',
                style: theme.textTheme.labelLarge?.copyWith(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(
            width: _labelWidth,
            child: Center(
              child: Text(
                '**℃',
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
  const _ReloadButton({required double buttonWidth}) : _buttonWidth = buttonWidth;
  final double _buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: _buttonWidth,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Close'),
          ),
        ),
        SizedBox(
          width: _buttonWidth,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: Colors.blue),
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
