import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("orDefault", () {
    int? number;
    expect(number.orDefault(1), 1);
  });
}
