
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:day8_tap_drag_enter/main.dart';

void main() {
  testWidgets('Add and remove a todo', (WidgetTester tester) async {
    await tester.pumpWidget(TodoList());

    await tester.enterText(find.byType(TextField), 'hi');

    await tester.tap(find.byType(FloatingActionButton));

    // Rebuild
    await tester.pump();

    expect(find.text('hi'), findsOneWidget);

    // Delete by dragging
    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

    // Rebuild until dismiss animation ends
    await tester.pumpAndSettle();

    // Item should be on the screen
    expect(find.text('hi'), findsNothing);
  });
}
