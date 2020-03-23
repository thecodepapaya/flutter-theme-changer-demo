// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_theme_changer/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ThemeChanger());

    final key = find.byKey(ValueKey('themeSwitch'));
    expect(key, findsOneWidget);

    final changedState =
        tester.state<ThemeChangerState>(find.byType(ThemeChanger));
    expect(changedState.currentTheme, ThemeData.light());
    expect(changedState.lightTheme, true);

    await tester.tap(key);
    await tester.pump();
    expect(key, findsOneWidget);

    final changedState2 =
        tester.state<ThemeChangerState>(find.byType(ThemeChanger));
    expect(changedState2.currentTheme, ThemeData.dark());
    expect(changedState2.lightTheme, false);

    await tester.tap(key);
    await tester.pump();
    expect(key, findsOneWidget);

    final changedState3 =
        tester.state<ThemeChangerState>(find.byType(ThemeChanger));
    expect(changedState3.currentTheme, ThemeData.light());
    expect(changedState3.lightTheme, true);

    // expect(currentTheme, matcher)

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
