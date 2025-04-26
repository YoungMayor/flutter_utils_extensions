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
}
