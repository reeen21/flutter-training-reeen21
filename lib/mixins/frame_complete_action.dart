import 'dart:async';
import 'package:flutter/material.dart';

mixin FrameCompleteAction {
  void runAfterFrame(VoidCallback action) {
    unawaited(
      WidgetsBinding.instance.endOfFrame.then((_) {
        action();
      }),
    );
  }
}
