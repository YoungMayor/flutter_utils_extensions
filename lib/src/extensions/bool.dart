part of './../extensions.dart';

extension MayrBoolExtensions on bool {
  /// Returns [trueValue] if this is true, otherwise returns [falseValue].
  ///
  /// This is a convenient way to conditionally select a value based on a boolean.
  ///
  /// Example:
  /// ```dart
  /// final isActive = true;
  /// final status = isActive.choose('Active', 'Inactive'); // 'Active'
  /// ```
  T choose<T>(T trueValue, T falseValue) => this ? trueValue : falseValue;

  /// Converts the boolean to an integer (1 for true, 0 for false).
  ///
  /// Example:
  /// ```dart
  /// true.toInt(); // 1
  /// false.toInt(); // 0
  /// ```
  int toInt() => this ? 1 : 0;

  /// Converts the boolean to a string representation.
  ///
  /// [trueString] is returned if true (default: 'Yes')
  /// [falseString] is returned if false (default: 'No')
  ///
  /// Example:
  /// ```dart
  /// true.toYesNo(); // 'Yes'
  /// false.toYesNo(); // 'No'
  /// true.toYesNo(trueString: 'Active', falseString: 'Inactive'); // 'Active'
  /// ```
  String toYesNo({String trueString = 'Yes', String falseString = 'No'}) =>
      this ? trueString : falseString;

  /// Returns the negation of this boolean.
  ///
  /// This is equivalent to `!this` but can be useful for chaining.
  ///
  /// Example:
  /// ```dart
  /// true.not; // false
  /// false.not; // true
  /// ```
  bool get not => !this;
}
