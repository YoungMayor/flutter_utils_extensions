part of './../extensions.dart';

extension MayrIterableExtensions<T> on Iterable<T> {
  /// Returns the first element or `null` if the iterable is empty.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].firstOrNull(); // 1
  /// [].firstOrNull(); // null
  /// ```
  T? firstOrNull() => isEmpty ? null : first;

  /// Returns the last element or `null` if the iterable is empty.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].lastOrNull(); // 3
  /// [].lastOrNull(); // null
  /// ```
  T? lastOrNull() => isEmpty ? null : last;

  /// Returns the single element that satisfies the predicate, or `null` if no such element exists.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].singleWhereOrNull((e) => e == 2); // 2
  /// [1, 2, 3].singleWhereOrNull((e) => e > 5); // null
  /// ```
  T? singleWhereOrNull(bool Function(T) predicate) {
    T? result;
    var found = false;
    for (var element in this) {
      if (predicate(element)) {
        if (found) return null; // More than one match
        result = element;
        found = true;
      }
    }
    return result;
  }

  /// Returns `true` if at least one element satisfies the predicate.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].containsWhere((e) => e > 2); // true
  /// [1, 2, 3].containsWhere((e) => e > 5); // false
  /// ```
  bool containsWhere(bool Function(T) predicate) => any(predicate);

  /// Returns the index of the first element that satisfies the predicate, or `null` if not found.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].indexWhereOrNull((e) => e == 2); // 1
  /// [1, 2, 3].indexWhereOrNull((e) => e > 5); // null
  /// ```
  int? indexWhereOrNull(bool Function(T) predicate) {
    var index = 0;
    for (var element in this) {
      if (predicate(element)) return index;
      index++;
    }
    return null;
  }

  /// Maps each element with its index.
  ///
  /// Example:
  /// ```dart
  /// ['a', 'b', 'c'].mapIndexed((i, e) => '$i: $e'); // ['0: a', '1: b', '2: c']
  /// ```
  Iterable<R> mapIndexed<R>(R Function(int index, T item) transform) sync* {
    var index = 0;
    for (var element in this) {
      yield transform(index++, element);
    }
  }

  /// Filters out null values from the iterable.
  ///
  /// Example:
  /// ```dart
  /// [1, null, 2, null, 3].whereNotNull(); // [1, 2, 3]
  /// ```
  Iterable<T> whereNotNull() => where((e) => e != null);

  /// Returns unique elements based on a key selector.
  ///
  /// Example:
  /// ```dart
  /// [Person('Alice', 30), Person('Bob', 25), Person('Alice', 35)]
  ///   .distinctBy((p) => p.name); // [Person('Alice', 30), Person('Bob', 25)]
  /// ```
  Iterable<T> distinctBy<K>(K Function(T) keySelector) {
    final seen = <K>{};
    return where((element) => seen.add(keySelector(element)));
  }

  /// Returns elements sorted by a key selector.
  ///
  /// Example:
  /// ```dart
  /// [Person('Bob', 25), Person('Alice', 30)].sortedBy((p) => p.name);
  /// // [Person('Alice', 30), Person('Bob', 25)]
  /// ```
  List<T> sortedBy<K extends Comparable<K>>(K Function(T) keySelector) {
    final list = toList();
    list.sort((a, b) => keySelector(a).compareTo(keySelector(b)));
    return list;
  }

  /// Returns elements sorted by a key selector in descending order.
  ///
  /// Example:
  /// ```dart
  /// [Person('Bob', 25), Person('Alice', 30)].sortedByDesc((p) => p.age);
  /// // [Person('Alice', 30), Person('Bob', 25)]
  /// ```
  List<T> sortedByDesc<K extends Comparable<K>>(K Function(T) keySelector) {
    final list = toList();
    list.sort((a, b) => keySelector(b).compareTo(keySelector(a)));
    return list;
  }

  /// Counts elements that satisfy the predicate.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].countWhere((e) => e > 3); // 2
  /// ```
  int countWhere(bool Function(T) predicate) => where(predicate).length;

  /// Checks if the iterable is `null` or empty.
  ///
  /// Example:
  /// ```dart
  /// [].isNullOrEmpty(); // true
  /// [1, 2, 3].isNullOrEmpty(); // false
  /// ```
  bool isNullOrEmpty() => isEmpty;

  /// Joins elements to a string with optional separator and transform.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].joinToString(separator: ', '); // '1, 2, 3'
  /// [1, 2, 3].joinToString(separator: ', ', transform: (e) => 'Item $e');
  /// // 'Item 1, Item 2, Item 3'
  /// ```
  String joinToString({String separator = '', String Function(T)? transform}) {
    if (transform != null) {
      return map(transform).join(separator);
    }
    return join(separator);
  }

  /// Executes an action for each element with its index.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].forEachIndexed((i, e) => print('$i: $e'));
  /// // Prints: '0: 1', '1: 2', '2: 3'
  /// ```
  void forEachIndexed(void Function(int index, T item) action) {
    var index = 0;
    for (var element in this) {
      action(index++, element);
    }
  }
}

extension MayrListExtensions<T> on List<T> {
  /// Returns the element at [index] or `null` if out of bounds.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].getOrNull(1); // 2
  /// [1, 2, 3].getOrNull(5); // null
  /// ```
  T? getOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Returns the element at [index] or [defaultValue] if out of bounds.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].getOrDefault(1, 0); // 2
  /// [1, 2, 3].getOrDefault(5, 0); // 0
  /// ```
  T getOrDefault(int index, T defaultValue) {
    if (index < 0 || index >= length) return defaultValue;
    return this[index];
  }

  /// Splits the list into chunks of the specified size.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].chunked(2); // [[1, 2], [3, 4], [5]]
  /// ```
  List<List<T>> chunked(int size) {
    if (size <= 0) throw ArgumentError('Size must be positive');
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  /// Flattens a list of lists into a single list.
  ///
  /// Example:
  /// ```dart
  /// [[1, 2], [3, 4], [5]].flatten(); // [1, 2, 3, 4, 5]
  /// ```
  List<E> flatten<E>() {
    final result = <E>[];
    for (var element in this) {
      if (element is List<E>) {
        result.addAll(element);
      }
    }
    return result;
  }

  /// Flips the list (reverses it).
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].flip(); // [3, 2, 1]
  /// ```
  List<T> flip() => reversed.toList();

  /// Inserts [value] if [condition] is true.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].insertIf(true, 4); // [1, 2, 3, 4]
  /// [1, 2, 3].insertIf(false, 4); // [1, 2, 3]
  /// ```
  List<T> insertIf(bool condition, T value) {
    final result = List<T>.from(this);
    if (condition) result.add(value);
    return result;
  }

  /// Replaces elements that satisfy the predicate with [newValue].
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 2].replaceWhere((e) => e == 2, 5); // [1, 5, 3, 5]
  /// ```
  List<T> replaceWhere(bool Function(T) predicate, T newValue) {
    return map((e) => predicate(e) ? newValue : e).toList();
  }

  /// Removes elements that do not satisfy the predicate.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].removeWhereNot((e) => e > 2); // [3, 4, 5]
  /// ```
  List<T> removeWhereNot(bool Function(T) predicate) {
    return where(predicate).toList();
  }

  /// Updates elements that satisfy the predicate using the updater function.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4].updateWhere((e) => e > 2, (e) => e * 2); // [1, 2, 6, 8]
  /// ```
  List<T> updateWhere(bool Function(T) predicate, T Function(T) updater) {
    return map((e) => predicate(e) ? updater(e) : e).toList();
  }

  /// Adds [value] if it's not null.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].addIf(4); // [1, 2, 3, 4]
  /// [1, 2, 3].addIf(null); // [1, 2, 3]
  /// ```
  List<T> addIf(T? value) {
    final result = List<T>.from(this);
    if (value != null) result.add(value);
    return result;
  }

  /// Adds all elements from [values] if not null.
  ///
  /// Example:
  /// ```dart
  /// [1, 2].addAllIf([3, 4]); // [1, 2, 3, 4]
  /// [1, 2].addAllIf(null); // [1, 2]
  /// ```
  List<T> addAllIf(Iterable<T>? values) {
    final result = List<T>.from(this);
    if (values != null) result.addAll(values);
    return result;
  }

  /// Appends [value] to the list (alias for add, returns new list).
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].append(4); // [1, 2, 3, 4]
  /// ```
  List<T> append(T value) {
    final result = List<T>.from(this);
    result.add(value);
    return result;
  }

  /// Appends all [values] to the list (returns new list).
  ///
  /// Example:
  /// ```dart
  /// [1, 2].appendAll([3, 4]); // [1, 2, 3, 4]
  /// ```
  List<T> appendAll(Iterable<T> values) {
    final result = List<T>.from(this);
    result.addAll(values);
    return result;
  }

  /// Appends [value] to the list if condition is true.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3].appendIf(4, true); // [1, 2, 3, 4]
  /// [1, 2, 3].appendIf(4, false); // [1, 2, 3]
  /// ```
  List<T> appendIf(T value, bool condition) {
    final result = List<T>.from(this);
    if (condition) result.add(value);
    return result;
  }

  /// Appends all [values] to the list if condition is true.
  ///
  /// Example:
  /// ```dart
  /// [1, 2].appendAllIf([3, 4], true); // [1, 2, 3, 4]
  /// [1, 2].appendAllIf([3, 4], false); // [1, 2]
  /// ```
  List<T> appendAllIf(Iterable<T> values, bool condition) {
    final result = List<T>.from(this);
    if (condition) result.addAll(values);
    return result;
  }

  /// Removes and returns the last element of the list.
  ///
  /// Example:
  /// ```dart
  /// var list = [1, 2, 3];
  /// list.pop(); // Returns 3, list is now [1, 2]
  /// ```
  T? pop() {
    if (isEmpty) return null;
    return removeLast();
  }

  /// Filters the list using the predicate (alias for where).
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 3, 4, 5].fliter((e) => e > 2); // [3, 4, 5]
  /// ```
  List<T> fliter(bool Function(T) predicate) => where(predicate).toList();

  /// Returns a list with unique elements.
  ///
  /// Example:
  /// ```dart
  /// [1, 2, 2, 3, 3, 4].unique(); // [1, 2, 3, 4]
  /// ```
  List<T> unique() => toSet().toList();
}

extension MayrNumIterableExtensions<T extends num> on Iterable<T> {
  /// Sums elements by applying a selector function.
  ///
  /// Example:
  /// ```dart
  /// [Person('Alice', 30), Person('Bob', 25)].sumBy((p) => p.age); // 55
  /// ```
  num sumBy(num Function(num) selector) =>
      map(selector).fold<num>(0, (a, b) => a + b);

  /// Calculates the average by applying a selector function.
  ///
  /// Example:
  /// ```dart
  /// [Person('Alice', 30), Person('Bob', 20)].averageBy((p) => p.age); // 25.0
  /// ```
  double averageBy(num Function(num) selector) {
    if (isEmpty) return 0;
    return sumBy(selector) / length;
  }

  /// Returns the minimum value in the iterable.
  ///
  /// Example:
  /// ```dart
  /// [3, 1, 4, 1, 5].min(); // 1
  /// [].min(); // null
  /// ```
  T? min() => isEmpty ? null : reduce((a, b) => a < b ? a : b);

  /// Returns the maximum value in the iterable.
  ///
  /// Example:
  /// ```dart
  /// [3, 1, 4, 1, 5].max(); // 5
  /// [].max(); // null
  /// ```
  T? max() => isEmpty ? null : reduce((a, b) => a > b ? a : b);
}
