import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/screens/main_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 500));
        _presentMainScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.green);
  }

  void _presentMainScreen() {
    unawaited(
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const MainScreen())),
    );
  }
}
