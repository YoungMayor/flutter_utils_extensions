# 🧩 Iterable / List Extensions

Comprehensive extensions for working with lists and iterables.

## Query & Search

- `firstOrNull()` → Returns first element or `null` if empty
- `lastOrNull()` → Returns last element or `null` if empty
- `singleWhereOrNull(predicate)` → Returns match or `null`
- `containsWhere(predicate)` → Boolean check
- `indexWhereOrNull(predicate)` → Returns index or `null`

### Examples

```dart
[1, 2, 3].firstOrNull(); // 1
[].firstOrNull(); // null
[1, 2, 3].singleWhereOrNull((e) => e == 2); // 2
[1, 2, 3].containsWhere((e) => e > 2); // true
```

## Safe Access

- `getOrNull(index)` → Returns element at index or `null`
- `getOrDefault(index, defaultValue)` → Returns element or default value

### Examples

```dart
[1, 2, 3].getOrNull(1); // 2
[1, 2, 3].getOrNull(5); // null
[1, 2, 3].getOrDefault(5, 0); // 0
```

## Transformations

- `chunked(size)` → Splits into chunks
- `mapIndexed((index, item) => ...)` → Maps with index
- `whereNotNull()` → Filters out nulls
- `distinctBy(keySelector)` → Unique items by property
- `flatten()` → Flattens nested lists
- `sortedBy(keySelector)` / `sortedByDesc(keySelector)` → Sort by property
- `flip()` → Reverses the list

### Examples

```dart
[1, 2, 3, 4, 5].chunked(2); // [[1, 2], [3, 4], [5]]
['a', 'b', 'c'].mapIndexed((i, e) => '$i: $e'); // ['0: a', '1: b', '2: c']
[1, null, 2, null, 3].whereNotNull(); // [1, 2, 3]
[[1, 2], [3, 4]].flatten(); // [1, 2, 3, 4]
[1, 2, 3].flip(); // [3, 2, 1]
```

## Aggregations (Only available on list of numbers)

- `sumBy(num Function(T))` → Sum elements by selector
- `averageBy(num Function(T))` → Average by selector
- `min()` → Minimum value
- `max()` → Maximum value
- `countWhere(predicate)` → Count matching elements

### Examples

```dart
[1, 2, 3, 4, 5].sumBy((e) => e); // 15
[1, 2, 3, 4, 5].averageBy((e) => e); // 3.0
[3, 1, 4, 1, 5].min(); // 1
[3, 1, 4, 1, 5].max(); // 5
[1, 2, 3, 4, 5].countWhere((e) => e > 3); // 2
```

## Mutation Helpers (returns new copy)

- `insertIf(condition, value)` → Insert conditionally
- `replaceWhere(predicate, newValue)` → Replace matching elements
- `removeWhereNot(predicate)` → Keep only matching elements
- `updateWhere(predicate, updater)` → Update matching elements
- `addIf(value)` / `addAllIf(values)` → Add conditionally
- `append(value)` / `appendAll(values)` → Append elements
- `appendIf(value)` / `appendAllIf(values)` → Append conditionally
- `pop()` → Remove and return last element
- `fliter(predicate)` → Filter elements (alias for where)
- `unique()` → Get unique elements

### Examples

```dart
[1, 2, 3].insertIf(true, 4); // [1, 2, 3, 4]
[1, 2, 3, 2].replaceWhere((e) => e == 2, 5); // [1, 5, 3, 5]
[1, 2, 3, 4, 5].removeWhereNot((e) => e > 2); // [3, 4, 5]
[1, 2, 2, 3, 3, 4].unique(); // [1, 2, 3, 4]
```

## Utility

- `isNullOrEmpty()` → Check if empty
- `joinToString(separator, transform)` → Join with custom format
- `forEachIndexed()` → Iterate with index

### Examples

```dart
[].isNullOrEmpty(); // true
[1, 2, 3].joinToString(separator: ', '); // '1, 2, 3'
['a', 'b'].forEachIndexed((i, e) => print('$i: $e'));
```

## Back to Documentation

[← Back to main documentation](./README.md)
