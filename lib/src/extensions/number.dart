part of './../extensions.dart';

extension MayrDoubleExtensions on double {
  /// Generates a random double less than this value but greater than or equal to [min].
  ///
  /// Example:
  /// ```dart
  /// 10.0.randomLess(); // Returns a value like 5.3, 7.8, etc.
  /// 10.0.randomLess(min: 5.0); // Returns a value between 5.0 and 10.0
  /// ```
  double randomLess({double min = 1.0}) {
    assert(min < this, 'min ($min) must be less than $this');

    return Random().nextDouble() * (this - min) + min;
  }

  /// Generates a random double greater than this value but less than or equal to [max].
  ///
  /// Example:
  /// ```dart
  /// 5.0.randomMore(10.0); // Returns a value like 6.2, 8.9, etc.
  /// ```
  double randomMore(double max) {
    assert(max > this, 'max ($max) must be greater than $this');

    return Random().nextDouble() * (max - this) + this;
  }

  /// Rounds the double to a specified number of decimal places.
  ///
  /// Example:
  /// ```dart
  /// 3.14159.toDecimalPlaces(2); // 3.14
  /// 3.14159.toDecimalPlaces(4); // 3.1416
  /// ```
  double toDecimalPlaces(int places) {
    final mod = pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}

extension MayrIntExtensions on int {
  /// Generates a random integer less than this value but greater than or equal to [min].
  ///
  /// Example:
  /// ```dart
  /// 10.randomLess(); // Returns a value like 3, 7, 9, etc.
  /// 10.randomLess(min: 5); // Returns a value between 5 and 9
  /// ```
  int randomLess({int min = 1}) {
    assert(min < this, 'min ($min) must be less than $this');

    return Random().nextInt(this - min) + min;
  }

  /// Generates a random integer greater than this value but less than or equal to [max].
  ///
  /// Example:
  /// ```dart
  /// 5.randomMore(10); // Returns a value like 6, 8, 9, etc.
  /// ```
  int randomMore(int max) {
    assert(max > this, 'max ($max) must be greater than $this');

    return Random().nextInt(max - this) + this;
  }

  /// Checks if the integer is even.
  ///
  /// Example:
  /// ```dart
  /// 4.isEven; // true
  /// 5.isEven; // false
  /// ```
  bool get isEvenNumber => this % 2 == 0;

  /// Checks if the integer is odd.
  ///
  /// Example:
  /// ```dart
  /// 5.isOdd; // true
  /// 4.isOdd; // false
  /// ```
  bool get isOddNumber => this % 2 != 0;

  /// Repeats an action [this] number of times.
  ///
  /// Example:
  /// ```dart
  /// 3.times(() => print('Hello')); // Prints 'Hello' three times
  /// ```
  void times(void Function() action) {
    for (int i = 0; i < this; i++) {
      action();
    }
  }

  /// Repeats an action [this] number of times with the current index.
  ///
  /// Example:
  /// ```dart
  /// 3.timesIndexed((i) => print('Index: $i'));
  /// // Prints: 'Index: 0', 'Index: 1', 'Index: 2'
  /// ```
  void timesIndexed(void Function(int index) action) {
    for (int i = 0; i < this; i++) {
      action(i);
    }
  }
}

extension MayrNumberExtensions on num {
  /// Checks if this number is equal to another number.
  ///
  /// Example:
  /// ```dart
  /// 5.isEqual(5); // true
  /// 5.isEqual(10); // false
  /// ```
  bool isEqual(num otherNum) => this == otherNum;

  /// Checks if this number is greater than another number.
  ///
  /// Example:
  /// ```dart
  /// 10.isGreaterThan(5); // true
  /// 5.isGreaterThan(10); // false
  /// ```
  bool isGreaterThan(num otherNum) => this > otherNum;

  /// Checks if this number is less than another number.
  ///
  /// Example:
  /// ```dart
  /// 5.isLessThan(10); // true
  /// 10.isLessThan(5); // false
  /// ```
  bool isLessThan(num otherNum) => this < otherNum;

  /// Clamps the number to a minimum value.
  ///
  /// Returns [min] if this number is less than [min], otherwise returns this number.
  ///
  /// Example:
  /// ```dart
  /// 3.clampMin(5); // 5
  /// 10.clampMin(5); // 10
  /// ```
  num clampMin(num min) => this < min ? min : this;

  /// Clamps the number to a maximum value.
  ///
  /// Returns [max] if this number is greater than [max], otherwise returns this number.
  ///
  /// Example:
  /// ```dart
  /// 10.clampMax(5); // 5
  /// 3.clampMax(5); // 3
  /// ```
  num clampMax(num max) => this > max ? max : this;

  /// Checks if this number is between [min] and [max] (inclusive).
  ///
  /// Example:
  /// ```dart
  /// 5.isBetween(1, 10); // true
  /// 15.isBetween(1, 10); // false
  /// ```
  bool isBetween(num min, num max) => this >= min && this <= max;

  /// Checks if this number is positive (greater than zero).
  ///
  /// Example:
  /// ```dart
  /// 5.isPositive; // true
  /// (-5).isPositive; // false
  /// ```
  bool get isPositive => this > 0;

  /// Checks if this number is negative (less than zero).
  ///
  /// Example:
  /// ```dart
  /// (-5).isNegative; // true
  /// 5.isNegative; // false
  /// ```
  bool get isNegativeNumber => this < 0;

  /// Checks if this number is zero.
  ///
  /// Example:
  /// ```dart
  /// 0.isZero; // true
  /// 5.isZero; // false
  /// ```
  bool get isZero => this == 0;
}

extension MayrNumberFormatExtensions on num {
  /// Formats this number as currency.
  ///
  /// [decimalDigits] specifies the number of decimal places (default: 2).
  /// [locale] specifies the locale for formatting (e.g., 'en_US').
  /// [symbol] specifies the currency symbol (e.g., '\$', '€').
  ///
  /// Example:
  /// ```dart
  /// 1234.56.formatAsCurrency(); // '$1,234.56'
  /// 1234.56.formatAsCurrency(symbol: '€'); // '€1,234.56'
  /// ```
  String formatAsCurrency({
    int decimalDigits = 2,
    String? locale,
    String? symbol,
  }) => NumberFormat.currency(
    locale: locale,
    symbol: symbol,
    decimalDigits: decimalDigits,
  ).format(this);

  /// Formats this number as a decimal.
  ///
  /// [locale] specifies the locale for formatting.
  /// [decimalDigits] specifies the number of decimal places (default: 2).
  ///
  /// Example:
  /// ```dart
  /// 0.85.formatAsDecimal(); // '85%'
  /// ```
  String formatAsDecimal({String? locale, int decimalDigits = 2}) =>
      NumberFormat.decimalPercentPattern(
        locale: locale,
        decimalDigits: decimalDigits,
      ).format(this);

  /// Formats this number with thousand separators.
  ///
  /// [locale] specifies the locale for formatting.
  ///
  /// Example:
  /// ```dart
  /// 1234567.formatAsNumber(); // '1,234,567'
  /// ```
  String formatAsNumber({String? locale}) =>
      NumberFormat.decimalPattern(locale).format(this);
}

extension MayrNumberToDurationExtensions on num {
  /// Converts this number to a [Duration] representing days.
  ///
  /// Example:
  /// ```dart
  /// 5.days; // Duration(days: 5)
  /// ```
  Duration get days => Duration(days: toInt());

  /// Converts this number to a [Duration] representing hours.
  ///
  /// Example:
  /// ```dart
  /// 3.hours; // Duration(hours: 3)
  /// ```
  Duration get hours => Duration(hours: toInt());

  /// Converts this number to a [Duration] representing microseconds.
  ///
  /// Example:
  /// ```dart
  /// 1000.microseconds; // Duration(microseconds: 1000)
  /// ```
  Duration get microseconds => Duration(microseconds: toInt());

  /// Converts this number to a [Duration] representing milliseconds.
  ///
  /// Example:
  /// ```dart
  /// 500.milliseconds; // Duration(milliseconds: 500)
  /// ```
  Duration get milliseconds => Duration(milliseconds: toInt());

  /// Converts this number to a [Duration] representing minutes.
  ///
  /// Example:
  /// ```dart
  /// 30.minutes; // Duration(minutes: 30)
  /// ```
  Duration get minutes => Duration(minutes: toInt());

  /// Converts this number to a [Duration] representing seconds.
  ///
  /// Example:
  /// ```dart
  /// 45.seconds; // Duration(seconds: 45)
  /// ```
  Duration get seconds => Duration(seconds: toInt());
}
