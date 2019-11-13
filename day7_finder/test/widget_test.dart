import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day7_finder/main.dart';

void main() {
  testWidgets('Finds a text widget by its text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('H'))));

    expect(find.text('H'), findsOneWidget);
  });

  testWidgets('Finds a widget by its key', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Scaffold(key: Key("hey"), body: Center())));

    expect(find.byKey(Key("hey")), findsOneWidget);
  });

  testWidgets('Finds a specific widget instance', (WidgetTester tester) async {
    final childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });

}
