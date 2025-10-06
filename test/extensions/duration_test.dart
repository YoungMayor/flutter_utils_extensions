import 'package:flutter_test/flutter_test.dart';

import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("toReadableString works correctly", () {
    expect(Duration(hours: 2, minutes: 30).toReadableString(), '2h 30m');
    expect(Duration(days: 1, hours: 5).toReadableString(), '1d 5h');
    expect(Duration(seconds: 45).toReadableString(), '45s');
    expect(
      Duration(days: 1, hours: 2, minutes: 30, seconds: 45).toReadableString(),
      '1d 2h 30m 45s',
    );
    expect(Duration(minutes: 5, seconds: 30).toReadableString(), '5m 30s');
    expect(Duration.zero.toReadableString(), '0s');
  });

  test("isLongerThan works correctly", () {
    expect(Duration(seconds: 5).isLongerThan(Duration(seconds: 3)), true);
    expect(Duration(seconds: 3).isLongerThan(Duration(seconds: 5)), false);
    expect(Duration(minutes: 2).isLongerThan(Duration(seconds: 59)), true);
  });

  test("isShorterThan works correctly", () {
    expect(Duration(seconds: 3).isShorterThan(Duration(seconds: 5)), true);
    expect(Duration(seconds: 5).isShorterThan(Duration(seconds: 3)), false);
    expect(Duration(seconds: 59).isShorterThan(Duration(minutes: 2)), true);
  });

  test("delay executes correctly", () async {
    final stopwatch = Stopwatch()..start();
    await Duration(milliseconds: 100).delay();
    stopwatch.stop();

    // Allow some tolerance for test execution
    expect(stopwatch.elapsedMilliseconds >= 100, true);
    expect(stopwatch.elapsedMilliseconds < 200, true);
  });

  test("delay with callback executes correctly", () async {
    bool callbackExecuted = false;
    await Duration(milliseconds: 50).delay(() {
      callbackExecuted = true;
    });

    expect(callbackExecuted, true);
  });
}
