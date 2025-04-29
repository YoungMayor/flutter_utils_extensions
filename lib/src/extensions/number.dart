part of './../extensions.dart';

extension MayrDoubleExtensions on double {
  double randomLess({double min = 1.0}) {
    assert(min < this, 'min ($min) must be less than $this');

    return Random().nextDouble() * (this - min) + min;
  }

  double randomMore(double max) {
    assert(max > this, 'max ($max) must be greater than $this');

    return Random().nextDouble() * (max - this) + this;
  }
}

extension MayrIntExtensions on int {
  int randomLess({int min = 1}) {
    assert(min < this, 'min ($min) must be less than $this');

    return Random().nextInt(this - min) + min;
  }

  int randomMore(int max) {
    assert(max > this, 'max ($max) must be greater than $this');

    return Random().nextInt(max - this) + this;
  }
}

extension MayrNumberExtensions on num {
  bool isEqual(num otherNum) => this == otherNum;

  bool isGreaterThan(num otherNum) => this > otherNum;

  bool isLessThan(num otherNum) => this < otherNum;

  num clampMin(num min) => this < min ? min : this;

  num clampMax(num max) => this > max ? max : this;
}

extension MayrNumberFormatExtensions on num {
  String formatAsCurrency({
    int decimalDigits = 2,
    String? locale,
    String? symbol,
  }) => NumberFormat.currency(
    locale: locale,
    symbol: symbol,
    decimalDigits: decimalDigits,
  ).format(this);

  String formatAsDecimal({String? locale, int decimalDigits = 2}) =>
      NumberFormat.decimalPercentPattern(
        locale: locale,
        decimalDigits: decimalDigits,
      ).format(this);

  String formatAsNumber({String? locale}) =>
      NumberFormat.decimalPattern(locale).format(this);
}

extension MayrNumberToDurationExtensions on num {
  Duration get days => Duration(days: toInt());

  Duration get hours => Duration(hours: toInt());

  Duration get microseconds => Duration(microseconds: toInt());

  Duration get milliseconds => Duration(milliseconds: toInt());

  Duration get minutes => Duration(minutes: toInt());

  Duration get seconds => Duration(seconds: toInt());
}
