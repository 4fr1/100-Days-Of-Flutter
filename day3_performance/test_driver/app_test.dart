import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

///
/// Run using: flutter drive --target=test_driver/app.dart
///

void main() {
  group('Scrollable App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('Performance test', () async {
      // Record performance
      final timeline = await driver.traceAction(() async {
        final listFinder = find.byValueKey("long_list");
        final itemFinder = find.byValueKey("item_50_text");

        await driver.scrollUntilVisible(listFinder, itemFinder, dyScroll: -300.0);
      });

      // Save
      final summary = TimelineSummary.summarize(timeline);
      summary.writeSummaryToFile('scrolling_summary', pretty: true);
      summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    });

  });
}