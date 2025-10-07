import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  group('Iterable Extensions', () {
    test('firstOrNull returns first element or null', () {
      expect([1, 2, 3].firstOrNull(), 1);
      expect([].firstOrNull(), null);
    });

    test('lastOrNull returns last element or null', () {
      expect([1, 2, 3].lastOrNull(), 3);
      expect([].lastOrNull(), null);
    });

    test('singleWhereOrNull returns matching element or null', () {
      expect([1, 2, 3].singleWhereOrNull((e) => e == 2), 2);
      expect([1, 2, 3].singleWhereOrNull((e) => e > 5), null);
      expect(
        [1, 2, 2, 3].singleWhereOrNull((e) => e == 2),
        null,
      ); // Multiple matches
    });

    test('containsWhere checks if predicate is satisfied', () {
      expect([1, 2, 3].containsWhere((e) => e > 2), true);
      expect([1, 2, 3].containsWhere((e) => e > 5), false);
    });

    test('indexWhereOrNull returns index or null', () {
      expect([1, 2, 3].indexWhereOrNull((e) => e == 2), 1);
      expect([1, 2, 3].indexWhereOrNull((e) => e > 5), null);
    });

    test('mapIndexed maps with index', () {
      final result = ['a', 'b', 'c'].mapIndexed((i, e) => '$i: $e').toList();
      expect(result, ['0: a', '1: b', '2: c']);
    });

    test('whereNotNull filters out nulls', () {
      expect([1, null, 2, null, 3].whereNotNull().toList(), [1, 2, 3]);
    });

    test('distinctBy returns unique elements by key', () {
      final list = [
        {'name': 'Alice', 'age': 30},
        {'name': 'Bob', 'age': 25},
        {'name': 'Alice', 'age': 35},
      ];
      final result = list.distinctBy((e) => e['name']).toList();
      expect(result.length, 2);
      expect(result[0]['name'], 'Alice');
      expect(result[1]['name'], 'Bob');
    });

    test('sortedBy sorts by key selector', () {
      final list = [
        {'name': 'Charlie', 'age': 30},
        {'name': 'Alice', 'age': 25},
        {'name': 'Bob', 'age': 35},
      ];
      final result = list.sortedBy((e) => e['name'] as String);
      expect(result[0]['name'], 'Alice');
      expect(result[1]['name'], 'Bob');
      expect(result[2]['name'], 'Charlie');
    });

    test('sortedByDesc sorts by key selector descending', () {
      final list = [
        {'name': 'Charlie', 'age': 30},
        {'name': 'Alice', 'age': 25},
        {'name': 'Bob', 'age': 35},
      ];
      final result = list.sortedByDesc((e) => e['age'] as int);
      expect(result[0]['age'], 35);
      expect(result[1]['age'], 30);
      expect(result[2]['age'], 25);
    });

    test('countWhere counts matching elements', () {
      expect([1, 2, 3, 4, 5].countWhere((e) => e > 3), 2);
      expect([1, 2, 3].countWhere((e) => e > 5), 0);
    });

    test('isNullOrEmpty checks if empty', () {
      expect([].isNullOrEmpty(), true);
      expect([1, 2, 3].isNullOrEmpty(), false);
    });

    test('joinToString joins elements', () {
      expect([1, 2, 3].joinToString(separator: ', '), '1, 2, 3');
      expect(
        [1, 2, 3].joinToString(separator: ', ', transform: (e) => 'Item $e'),
        'Item 1, Item 2, Item 3',
      );
    });

    test('forEachIndexed executes with index', () {
      final indices = <int>[];
      final items = <String>[];
      ['a', 'b', 'c'].forEachIndexed((i, e) {
        indices.add(i);
        items.add(e);
      });
      expect(indices, [0, 1, 2]);
      expect(items, ['a', 'b', 'c']);
    });
  });

  group('List Extensions', () {
    test('getOrNull returns element or null', () {
      expect([1, 2, 3].getOrNull(1), 2);
      expect([1, 2, 3].getOrNull(5), null);
      expect([1, 2, 3].getOrNull(-1), null);
    });

    test('getOrDefault returns element or default', () {
      expect([1, 2, 3].getOrDefault(1, 0), 2);
      expect([1, 2, 3].getOrDefault(5, 0), 0);
    });

    test('chunked splits into chunks', () {
      expect([1, 2, 3, 4, 5].chunked(2), [
        [1, 2],
        [3, 4],
        [5],
      ]);
      expect([1, 2, 3].chunked(1), [
        [1],
        [2],
        [3],
      ]);
      expect([1, 2, 3].chunked(5), [
        [1, 2, 3],
      ]);
    });

    test('flatten flattens nested lists', () {
      expect(
        [
          [1, 2],
          [3, 4],
          [5],
        ].flatten<int>(),
        [1, 2, 3, 4, 5],
      );
      expect(
        [
          [],
          [1],
          [2, 3],
        ].flatten<int>(),
        [1, 2, 3],
      );
    });

    test('flip reverses the list', () {
      expect([1, 2, 3].flip(), [3, 2, 1]);
      expect([1].flip(), [1]);
      expect([].flip(), []);
    });

    test('insertIf inserts conditionally', () {
      expect([1, 2, 3].insertIf(true, 4), [1, 2, 3, 4]);
      expect([1, 2, 3].insertIf(false, 4), [1, 2, 3]);
    });

    test('replaceWhere replaces matching elements', () {
      expect([1, 2, 3, 2].replaceWhere((e) => e == 2, 5), [1, 5, 3, 5]);
    });

    test('removeWhereNot keeps matching elements', () {
      expect([1, 2, 3, 4, 5].removeWhereNot((e) => e > 2), [3, 4, 5]);
    });

    test('updateWhere updates matching elements', () {
      expect([1, 2, 3, 4].updateWhere((e) => e > 2, (e) => e * 2), [
        1,
        2,
        6,
        8,
      ]);
    });

    test('addIf adds value conditionally', () {
      expect([1, 2, 3].addIf(4), [1, 2, 3, 4]);
      expect([1, 2, 3].addIf(null), [1, 2, 3]);
    });

    test('addAllIf adds values conditionally', () {
      expect([1, 2].addAllIf([3, 4]), [1, 2, 3, 4]);
      expect([1, 2].addAllIf(null), [1, 2]);
    });

    test('append adds value', () {
      expect([1, 2, 3].append(4), [1, 2, 3, 4]);
    });

    test('appendAll adds all values', () {
      expect([1, 2].appendAll([3, 4]), [1, 2, 3, 4]);
    });

    test('appendIf adds value conditionally', () {
      expect([1, 2, 3].appendIf(4, true), [1, 2, 3, 4]);
      expect([1, 2, 3].appendIf(4, false), [1, 2, 3]);
    });

    test('appendAllIf adds values conditionally', () {
      expect([1, 2].appendAllIf([3, 4], true), [1, 2, 3, 4]);
      expect([1, 2].appendAllIf([3, 4], false), [1, 2]);
    });

    test('pop removes and returns last element', () {
      var list = [1, 2, 3];
      expect(list.pop(), 3);
      expect(list, [1, 2]);
      expect([].pop(), null);
    });

    test('fliter filters elements', () {
      expect([1, 2, 3, 4, 5].fliter((e) => e > 2), [3, 4, 5]);
    });

    test('unique returns unique elements', () {
      expect([1, 2, 2, 3, 3, 4].unique(), [1, 2, 3, 4]);
    });
  });

  group('Num Iterable Extensions', () {
    test('sumBy sums elements', () {
      expect([1, 2, 3, 4, 5].sumBy((e) => e), 15);
      expect([2, 4, 6].sumBy((e) => e * 2), 24);
    });

    test('averageBy calculates average', () {
      expect([1, 2, 3, 4, 5].averageBy((e) => e), 3.0);
      expect(<num>[].averageBy((e) => e), 0);
    });

    test('min returns minimum', () {
      expect([3, 1, 4, 1, 5].min(), 1);
    });

    test('max returns maximum', () {
      expect([3, 1, 4, 1, 5].max(), 5);
    });
  });
}
