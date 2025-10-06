import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("orDefault works correctly", () {
    int? nullNumber;
    expect(nullNumber.orDefault(1), 1);

    int? number = 5;
    expect(number.orDefault(1), 5);

    String? nullString;
    expect(nullString.orDefault('default'), 'default');

    String? str = 'value';
    expect(str.orDefault('default'), 'value');
  });

  test("maybe returns null based on probability", () {
    // Test that maybe with probability 0 never returns null
    for (int i = 0; i < 10; i++) {
      expect('value'.maybe(probability: 0.0), isNotNull);
    }

    // Test that maybe with probability 1 always returns null
    for (int i = 0; i < 10; i++) {
      expect('value'.maybe(probability: 1.0), isNull);
    }
  });

  // Note: nullOnDebug and onlyOnDebug are environment-dependent
  // and difficult to test reliably in unit tests
}
