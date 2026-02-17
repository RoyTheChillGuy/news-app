// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:skl_news/main.dart';

void main() {
  testWidgets('Splash screen displays correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the splash screen shows the app title
    expect(find.text('News App'), findsOneWidget);
    expect(find.text('Stay Updated with Latest News'), findsOneWidget);
    expect(find.byIcon(Icons.newspaper_rounded), findsOneWidget);

    // Advance time to trigger navigation and complete the test
    await tester.pump(const Duration(seconds: 3));
  });
}
