# 🗺️ Map Extensions

Extensions for working with `Map` objects.

## Safe Access

- `getOrNull(key)` → Get value or null
- `getOrDefault(key, defaultValue)` → Get value or default

### Examples

```dart
{'a': 1, 'b': 2}.getOrNull('a'); // 1
{'a': 1, 'b': 2}.getOrNull('c'); // null
{'a': 1, 'b': 2}.getOrDefault('c', 0); // 0
```

## Transformations

- `mapKeys((k, v) => newKey)` → Transform keys
- `mapValues((k, v) => newValue)` → Transform values
- `filterKeys(predicate)` → Filter by keys
- `filterValues(predicate)` → Filter by values
- `invert()` → Swap keys and values

### Examples

```dart
{'a': 1, 'b': 2}.mapKeys((k, v) => k.toUpperCase()); // {'A': 1, 'B': 2}
{'a': 1, 'b': 2}.mapValues((k, v) => v * 2); // {'a': 2, 'b': 4}
{'a': 1, 'b': 2}.invert(); // {1: 'a', 2: 'b'}
```

## Merge & Combine

- `merge(otherMap)` → Merge with precedence
- `mergeIfAbsent(otherMap)` → Merge without overriding
- `combine(other, (k, v1, v2) => mergedValue)` → Custom merge

### Examples

```dart
{'a': 1, 'b': 2}.merge({'b': 3, 'c': 4}); // {'a': 1, 'b': 3, 'c': 4}
{'a': 1, 'b': 2}.mergeIfAbsent({'b': 3, 'c': 4}); // {'a': 1, 'b': 2, 'c': 4}
```

## Utility

- `keysWhere(predicate)` → Get keys matching predicate
- `valuesWhere(predicate)` → Get values matching predicate
- `toQueryString()` → Convert to URL query string

### Examples

```dart
{'a': 1, 'b': 2, 'c': 3}.keysWhere((v) => v > 1); // ['b', 'c']
{'name': 'John', 'age': '30'}.toQueryString(); // 'name=John&age=30'
```

## Back to Documentation

[← Back to main documentation](./README.md)
