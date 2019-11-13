import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Sample Tests', () {
    // Create finders for the widgets
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to Flutter driver before running tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close connection to driver after tests finished
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      expect(await driver.getText(counterTextFinder), "0");
    });

    test('increments the counter', () async {
      await driver.tap(buttonFinder);

      expect(await driver.getText(counterTextFinder), "1");
    });
  });

  group('Another Test', () {
    // Create finders for the widgets
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to Flutter driver before running tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close connection to driver after tests finished
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    group('Useless Group', () {
      test('increments the counter 100 times', () async {
        for (int i = 0; i < 100; i++) await driver.tap(buttonFinder);

        expect(await driver.getText(counterTextFinder), "100");
      });
    });
  });
}
