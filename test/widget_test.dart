import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:techdea/main.dart';

void main() {
  testWidgets('TechDea Splash Screen smoke test and logo presentation',
      (WidgetTester tester) async {
    await tester.pumpWidget(const TechDeaApp());

    // Verify TechDea title and logo on Splash Screen
    expect(find.text('TECHDEA'), findsOneWidget);
    expect(find.text('INNOVATE'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    // Pump past the splash screen timer (2800ms + 650ms transition)
    await tester.pump(const Duration(milliseconds: 3000));
    await tester.pumpAndSettle();

    // Verify HomeScreen is reached
    expect(find.text('WELCOME TO TECHDEA'), findsOneWidget);
    expect(find.text('Next-Gen Digital Solutions'), findsOneWidget);
  });
}
