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
        await _presentMainScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.green);
  }

  Future<void> _presentMainScreen() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      await Navigator.of(
        context,
      ).push(MaterialPageRoute<void>(builder: (context) => const MainScreen()));
    }
    await _presentMainScreen();
  }
}
