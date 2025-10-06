import 'package:flutter_test/flutter_test.dart';

import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("choose works correctly", () {
    expect(true.choose('Yes', 'No'), 'Yes');
    expect(false.choose('Yes', 'No'), 'No');
    expect(true.choose(1, 0), 1);
    expect(false.choose(1, 0), 0);
  });

  test("toInt works correctly", () {
    expect(true.toInt(), 1);
    expect(false.toInt(), 0);
  });

  test("toYesNo works correctly", () {
    expect(true.toYesNo(), 'Yes');
    expect(false.toYesNo(), 'No');
    expect(
      true.toYesNo(trueString: 'Active', falseString: 'Inactive'),
      'Active',
    );
    expect(
      false.toYesNo(trueString: 'Active', falseString: 'Inactive'),
      'Inactive',
    );
  });

  test("not works correctly", () {
    expect(true.not, false);
    expect(false.not, true);
  });
}
