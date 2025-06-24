import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/screens/launch_screen.dart';
import 'package:flutter_training/screens/main_screen.dart';

void main() {
  testWidgets('LaunchScreenが表示された3秒後にMainScreenに遷移する', (tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1000));
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: LaunchScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(MainScreen), findsOneWidget);
  });
}
