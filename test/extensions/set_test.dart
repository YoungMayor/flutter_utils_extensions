import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  group('Set Extensions', () {
    test('toggle adds element if missing', () {
      final result = {1, 2, 3}.toggle(4);
      expect(result, {1, 2, 3, 4});
    });

    test('toggle removes element if present', () {
      final result = {1, 2, 3}.toggle(2);
      expect(result, {1, 3});
    });

    test('intersects returns true if sets have common elements', () {
      expect({1, 2, 3}.intersects({2, 3, 4}), true);
      expect({1, 2}.intersects({3, 4}), false);
    });

    test('isSubsetOf returns true if this set is contained in other', () {
      expect({1, 2}.isSubsetOf({1, 2, 3}), true);
      expect({1, 4}.isSubsetOf({1, 2, 3}), false);
      expect({1, 2, 3}.isSubsetOf({1, 2, 3}), true);
    });

    test('isSupersetOf returns true if this set contains other', () {
      expect({1, 2, 3}.isSupersetOf({1, 2}), true);
      expect({1, 2}.isSupersetOf({1, 2, 3}), false);
      expect({1, 2, 3}.isSupersetOf({1, 2, 3}), true);
    });

    test('unionAll combines multiple sets', () {
      final result = {1, 2}.unionAll([
        {2, 3},
        {3, 4},
      ]);
      expect(result, {1, 2, 3, 4});
    });

    test('without removes element', () {
      final result = {1, 2, 3}.without(2);
      expect(result, {1, 3});
    });

    test('without does nothing if element not present', () {
      final result = {1, 2, 3}.without(4);
      expect(result, {1, 2, 3});
    });
  });
}
