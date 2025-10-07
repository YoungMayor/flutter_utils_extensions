part of './../extensions.dart';

extension MayrSetExtensions<T> on Set<T> {
  /// Toggles [element] in the set - adds if missing, removes if present.
  ///
  /// Example:
  /// ```dart
  /// var set = {1, 2, 3};
  /// set.toggle(2); // {1, 3}
  /// set.toggle(4); // {1, 3, 4}
  /// ```
  Set<T> toggle(T element) {
    final result = Set<T>.from(this);
    if (result.contains(element)) {
      result.remove(element);
    } else {
      result.add(element);
    }
    return result;
  }

  /// Returns `true` if this set intersects with [otherSet].
  ///
  /// Example:
  /// ```dart
  /// {1, 2, 3}.intersects({2, 3, 4}); // true
  /// {1, 2}.intersects({3, 4}); // false
  /// ```
  bool intersects(Set<T> otherSet) => intersection(otherSet).isNotEmpty;

  /// Returns `true` if this set is a subset of [otherSet].
  ///
  /// Example:
  /// ```dart
  /// {1, 2}.isSubsetOf({1, 2, 3}); // true
  /// {1, 4}.isSubsetOf({1, 2, 3}); // false
  /// ```
  bool isSubsetOf(Set<T> otherSet) => difference(otherSet).isEmpty;

  /// Returns `true` if this set is a superset of [otherSet].
  ///
  /// Example:
  /// ```dart
  /// {1, 2, 3}.isSupersetOf({1, 2}); // true
  /// {1, 2}.isSupersetOf({1, 2, 3}); // false
  /// ```
  bool isSupersetOf(Set<T> otherSet) => otherSet.difference(this).isEmpty;

  /// Returns the union of this set with all [sets].
  ///
  /// Example:
  /// ```dart
  /// {1, 2}.unionAll([{2, 3}, {3, 4}]); // {1, 2, 3, 4}
  /// ```
  Set<T> unionAll(Iterable<Set<T>> sets) {
    var result = Set<T>.from(this);
    for (var set in sets) {
      result = result.union(set);
    }
    return result;
  }

  /// Returns a new set without [element].
  ///
  /// Example:
  /// ```dart
  /// {1, 2, 3}.without(2); // {1, 3}
  /// ```
  Set<T> without(T element) {
    return Set<T>.from(this)..remove(element);
  }
}
