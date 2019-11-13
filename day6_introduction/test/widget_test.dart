import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// Test command: flutter test test/widget_test.dart
///

class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}

void main() {

  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));

    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Alternatives to findsOneWidget: findsNoWidget, findsNWidgets
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

}
