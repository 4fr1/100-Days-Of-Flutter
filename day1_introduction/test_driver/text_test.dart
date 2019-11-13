import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

///
/// Run using: flutter drive --target=test_driver/text.dart
///

void main() {
  group("Test Text Widget", () {
    final textWidget = find.byValueKey("hi");

    FlutterDriver driver;

    setUp(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("text equals HELLO", () async {
      expect(await driver.getText(textWidget), "HELLO");
    });

  });

}