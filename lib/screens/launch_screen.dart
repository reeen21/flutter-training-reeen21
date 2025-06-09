import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/mixins/frame_complete_action.dart';
import 'package:flutter_training/screens/main_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> with FrameCompleteAction {
  @override
  void initState() {
    super.initState();
    runAfterFrame(() async {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      _presentMainScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  void _presentMainScreen() {
    unawaited(
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const MainScreen())),
    );
  }
}
