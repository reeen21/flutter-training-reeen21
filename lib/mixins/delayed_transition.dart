import 'dart:async';
import 'package:flutter/material.dart';

mixin DelayedTransition {
  void navigation(VoidCallback onNavigate) {
    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 500));
        onNavigate();
      }),
    );
  }
}
