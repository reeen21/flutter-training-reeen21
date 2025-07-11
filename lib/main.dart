import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/screens/launch_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LaunchScreen());
  }
}
