import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("Age tests", () {
    int testAge = 24;

    DateTime dateTime = DateTime.now().subYears(testAge);

    expect(dateTime.toAge(), testAge);

    expect(dateTime.isAgeBetween(testAge - 1, testAge + 1), isTrue);

    expect(dateTime.isAgeEqualTo(testAge), isTrue);
    expect(dateTime.isAgeEqualTo(testAge + 1), isFalse);
    expect(dateTime.isAgeEqualTo(testAge - 1), isFalse);

    expect(dateTime.isAgeOlder(testAge - 1), isTrue);
    expect(dateTime.isAgeOlder(testAge + 1), isFalse);

    expect(dateTime.isAgeYounger(testAge + 1), isTrue);
    expect(dateTime.isAgeYounger(testAge - 1), isFalse);
  });
}
