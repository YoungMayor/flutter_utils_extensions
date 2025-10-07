import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  group('Map Extensions', () {
    test('getOrNull returns value or null', () {
      expect({'a': 1, 'b': 2}.getOrNull('a'), 1);
      expect({'a': 1, 'b': 2}.getOrNull('c'), null);
    });

    test('getOrDefault returns value or default', () {
      expect({'a': 1, 'b': 2}.getOrDefault('a', 0), 1);
      expect({'a': 1, 'b': 2}.getOrDefault('c', 0), 0);
    });

    test('mapKeys transforms keys', () {
      final result = {'a': 1, 'b': 2}.mapKeys((k, v) => k.toUpperCase());
      expect(result, {'A': 1, 'B': 2});
    });

    test('mapValues transforms values', () {
      final result = {'a': 1, 'b': 2}.mapValues((k, v) => v * 2);
      expect(result, {'a': 2, 'b': 4});
    });

    test('filterKeys filters by key predicate', () {
      final result = {'a': 1, 'b': 2, 'c': 3}.filterKeys((k) => k != 'b');
      expect(result, {'a': 1, 'c': 3});
    });

    test('filterValues filters by value predicate', () {
      final result = {'a': 1, 'b': 2, 'c': 3}.filterValues((v) => v > 1);
      expect(result, {'b': 2, 'c': 3});
    });

    test('invert swaps keys and values', () {
      final result = {'a': 1, 'b': 2}.invert();
      expect(result, {1: 'a', 2: 'b'});
    });

    test('merge combines maps with precedence', () {
      final result = {'a': 1, 'b': 2}.merge({'b': 3, 'c': 4});
      expect(result, {'a': 1, 'b': 3, 'c': 4});
    });

    test('mergeIfAbsent combines maps without overriding', () {
      final result = {'a': 1, 'b': 2}.mergeIfAbsent({'b': 3, 'c': 4});
      expect(result, {'a': 1, 'b': 2, 'c': 4});
    });

    test('combine merges with custom combiner', () {
      final result = {
        'a': 1,
        'b': 2,
      }.combine({'b': 3, 'c': 4}, (k, v1, v2) => v1 + v2);
      expect(result, {'a': 1, 'b': 5, 'c': 4});
    });

    test('keysWhere returns keys matching predicate', () {
      final result = {'a': 1, 'b': 2, 'c': 3}.keysWhere((v) => v > 1).toList();
      expect(result, ['b', 'c']);
    });

    test('valuesWhere returns values matching predicate', () {
      final result =
          {'a': 1, 'b': 2, 'c': 3}.valuesWhere((k) => k != 'b').toList();
      expect(result, [1, 3]);
    });

    test('toQueryString converts to URL query string', () {
      final result = {'name': 'John', 'age': '30'}.toQueryString();
      expect(result, 'name=John&age=30');
    });

    test('toQueryString handles special characters', () {
      final result =
          {'key': 'value with spaces', 'special': 'a&b=c'}.toQueryString();
      expect(
        result.contains('value+with+spaces') ||
            result.contains('value%20with%20spaces'),
        true,
      );
    });
  });
}
