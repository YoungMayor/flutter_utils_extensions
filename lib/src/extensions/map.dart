part of './../extensions.dart';

extension MayrMapExtensions<K, V> on Map<K, V> {
  /// Returns the value for [key] or `null` if the key doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.getOrNull('a'); // 1
  /// {'a': 1, 'b': 2}.getOrNull('c'); // null
  /// ```
  V? getOrNull(K key) => this[key];

  /// Returns the value for [key] or [defaultValue] if the key doesn't exist.
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.getOrDefault('a', 0); // 1
  /// {'a': 1, 'b': 2}.getOrDefault('c', 0); // 0
  /// ```
  V getOrDefault(K key, V defaultValue) => this[key] ?? defaultValue;

  /// Creates a new map with keys transformed by [transform].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.mapKeys((k, v) => k.toUpperCase());
  /// // {'A': 1, 'B': 2}
  /// ```
  Map<K2, V> mapKeys<K2>(K2 Function(K key, V value) transform) {
    return Map.fromEntries(
      entries.map((e) => MapEntry(transform(e.key, e.value), e.value)),
    );
  }

  /// Creates a new map with values transformed by [transform].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.mapValues((k, v) => v * 2);
  /// // {'a': 2, 'b': 4}
  /// ```
  Map<K, V2> mapValues<V2>(V2 Function(K key, V value) transform) {
    return Map.fromEntries(
      entries.map((e) => MapEntry(e.key, transform(e.key, e.value))),
    );
  }

  /// Creates a new map with only the entries whose keys satisfy [predicate].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.filterKeys((k) => k != 'b');
  /// // {'a': 1, 'c': 3}
  /// ```
  Map<K, V> filterKeys(bool Function(K key) predicate) {
    return Map.fromEntries(entries.where((e) => predicate(e.key)));
  }

  /// Creates a new map with only the entries whose values satisfy [predicate].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.filterValues((v) => v > 1);
  /// // {'b': 2, 'c': 3}
  /// ```
  Map<K, V> filterValues(bool Function(V value) predicate) {
    return Map.fromEntries(entries.where((e) => predicate(e.value)));
  }

  /// Creates a new map with keys and values swapped.
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.invert();
  /// // {1: 'a', 2: 'b'}
  /// ```
  Map<V, K> invert() {
    return Map.fromEntries(entries.map((e) => MapEntry(e.value, e.key)));
  }

  /// Merges this map with [otherMap], with entries from [otherMap] taking precedence.
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.merge({'b': 3, 'c': 4});
  /// // {'a': 1, 'b': 3, 'c': 4}
  /// ```
  Map<K, V> merge(Map<K, V> otherMap) {
    return {...this, ...otherMap};
  }

  /// Merges this map with [otherMap], but only adds entries that don't exist in this map.
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.mergeIfAbsent({'b': 3, 'c': 4});
  /// // {'a': 1, 'b': 2, 'c': 4}
  /// ```
  Map<K, V> mergeIfAbsent(Map<K, V> otherMap) {
    final result = Map<K, V>.from(this);
    otherMap.forEach((key, value) {
      result.putIfAbsent(key, () => value);
    });
    return result;
  }

  /// Combines this map with [other] using a [combiner] function for conflicting keys.
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2}.combine({'b': 3, 'c': 4}, (k, v1, v2) => v1 + v2);
  /// // {'a': 1, 'b': 5, 'c': 4}
  /// ```
  Map<K, V> combine(
    Map<K, V> other,
    V Function(K key, V value1, V value2) combiner,
  ) {
    final result = Map<K, V>.from(this);
    other.forEach((key, value) {
      if (result.containsKey(key)) {
        result[key] = combiner(key, result[key] as V, value);
      } else {
        result[key] = value;
      }
    });
    return result;
  }

  /// Returns all keys whose values satisfy [predicate].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.keysWhere((v) => v > 1);
  /// // ['b', 'c']
  /// ```
  Iterable<K> keysWhere(bool Function(V value) predicate) {
    return entries.where((e) => predicate(e.value)).map((e) => e.key);
  }

  /// Returns all values whose keys satisfy [predicate].
  ///
  /// Example:
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.valuesWhere((k) => k != 'b');
  /// // [1, 3]
  /// ```
  Iterable<V> valuesWhere(bool Function(K key) predicate) {
    return entries.where((e) => predicate(e.key)).map((e) => e.value);
  }

  /// Converts the map to a URL query string.
  ///
  /// Example:
  /// ```dart
  /// {'name': 'John', 'age': '30'}.toQueryString();
  /// // 'name=John&age=30'
  /// ```
  String toQueryString() {
    return entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key.toString())}=${Uri.encodeComponent(e.value.toString())}',
        )
        .join('&');
  }
}
