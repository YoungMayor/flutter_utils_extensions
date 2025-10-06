import 'package:flutter_test/flutter_test.dart';

import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("Clamps well", () {
    expect(10.clampMin(2), 10);
    expect(10.clampMin(20), 20);

    expect(10.clampMax(20), 10);
    expect(10.clampMax(2), 2);

    expect(1.clamp(2, 20), 2);
    expect(10.clamp(2, 20), 10);
    expect(100.clamp(2, 20), 20);
  });

  test("isBetween works correctly", () {
    expect(5.isBetween(1, 10), true);
    expect(15.isBetween(1, 10), false);
    expect(1.isBetween(1, 10), true);
    expect(10.isBetween(1, 10), true);
    expect(0.isBetween(1, 10), false);
  });

  test("isPositive, isNegativeNumber, and isZero work correctly", () {
    expect(5.isPositive, true);
    expect((-5).isPositive, false);
    expect(0.isPositive, false);

    expect((-5).isNegativeNumber, true);
    expect(5.isNegativeNumber, false);
    expect(0.isNegativeNumber, false);

    expect(0.isZero, true);
    expect(5.isZero, false);
    expect((-5).isZero, false);
  });

  test("isEvenNumber and isOddNumber work correctly", () {
    expect(2.isEvenNumber, true);
    expect(4.isEvenNumber, true);
    expect(3.isEvenNumber, false);
    expect(5.isEvenNumber, false);

    expect(3.isOddNumber, true);
    expect(5.isOddNumber, true);
    expect(2.isOddNumber, false);
    expect(4.isOddNumber, false);
  });

  test("toDecimalPlaces works correctly", () {
    expect(3.14159.toDecimalPlaces(2), 3.14);
    expect(3.14159.toDecimalPlaces(4), 3.1416);
    expect(2.5.toDecimalPlaces(0), 3.0); // 2.5 rounds to 3 (standard rounding)
    expect(2.555.toDecimalPlaces(2), 2.56);
  });

  test("times executes action correctly", () {
    int count = 0;
    3.times(() => count++);
    expect(count, 3);

    count = 0;
    0.times(() => count++);
    expect(count, 0);
  });

  test("timesIndexed executes action with index correctly", () {
    List<int> indices = [];
    3.timesIndexed((i) => indices.add(i));
    expect(indices, [0, 1, 2]);

    indices = [];
    0.timesIndexed((i) => indices.add(i));
    expect(indices, []);
  });

  test("Duration conversions work correctly", () {
    expect(5.days, Duration(days: 5));
    expect(3.hours, Duration(hours: 3));
    expect(30.minutes, Duration(minutes: 30));
    expect(45.seconds, Duration(seconds: 45));
    expect(500.milliseconds, Duration(milliseconds: 500));
    expect(1000.microseconds, Duration(microseconds: 1000));
  });
}
