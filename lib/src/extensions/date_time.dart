part of './../extensions.dart';

extension MayrDateTimeTimeOfDayExtensions on DateTime {
  /// Check if the date is in the afternoon.
  bool get isAfternoon => hour >= 12 && hour < 18;

  /// Check if the date is in the evening.
  bool get isEvening => hour >= 18 && hour < 24;

  /// Check if the date is in the morning.
  bool get isMorning => hour >= 0 && hour < 12;

  /// Check if the date is in the night.
  bool get isNight => hour >= 0 && hour < 6;
}

extension MayrDateTimeAgeExtensions on DateTime {
  /// Format [DateTime] to an age
  int toAge() => DateTime.now().difference(this).inDays ~/ 365;

  /// Check if [DateTime] is between a certain [min] and [max] age
  bool isAgeBetween(int min, int max) => toAge() >= min && toAge() <= max;

  /// Check if [DateTime] is equal to a certain [age]
  bool isAgeEqualTo(int age) => toAge() == age;

  /// Check if [DateTime] is older than a certain [age]
  bool isAgeOlder(int age) => toAge() > age;

  /// Check if [DateTime] is younger than a certain [age]
  bool isAgeYounger(int age) => toAge() < age;
}

extension MayrDateTimeChecksExtensions on DateTime {
  static DateTime get _now => DateTime.now();

  static DateTime get _tomorrow => _now.addDays(1);

  static DateTime get _yesterday => _now.subDays(1);

  /// Check if [DateTime] is in the future
  bool get isInFuture => isAfter(DateTime.now());

  /// Check if [DateTime] is in the past
  bool get isInPast => isBefore(DateTime.now());

  bool isSameDay(DateTime otherDate) =>
      day == otherDate.day &&
      month == otherDate.month &&
      year == otherDate.year;

  /// Check if [DateTime] is today
  bool get isToday => isSameDay(_now);

  /// Check if [DateTime] is tomorrow
  bool get isTomorrow => isSameDay(_tomorrow);

  /// Check if [DateTime] is yesterday
  bool get isYesterday => isSameDay(_yesterday);
}

extension MayrDateTimeExtensions on DateTime {
  /// Get the start of the given day
  DateTime startOfDay() => DateTime(year, month, day);
}

extension MayrDateTimeManipulationExtensions on DateTime {
  /// Add days to a [DateTime]
  DateTime addDays(int days) => add(Duration(days: days));

  /// Add hours to a [DateTime]
  DateTime addHours(int hours) => add(Duration(hours: hours));

  /// Add minutes to a [DateTime]
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));

  /// Add months to a [DateTime]
  DateTime addMonths(int months) => DateTime(
    year,
    month + months,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );

  /// Add seconds to a [DateTime]
  DateTime addSeconds(int seconds) => add(Duration(seconds: seconds));

  /// Add years to a [DateTime]
  DateTime addYears(int years) => DateTime(
    year + years,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );

  /// Subtract days from a [DateTime]
  DateTime subDays(int days) => subtract(Duration(days: days));

  /// Subtract hours from a [DateTime]
  DateTime subHours(int hours) => subtract(Duration(hours: hours));

  /// Subtract minutes from a [DateTime]
  DateTime subMinutes(int minutes) => subtract(Duration(minutes: minutes));

  /// Subtract months from a [DateTime]
  DateTime subMonths(int months) => DateTime(
    year,
    month - months,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );

  /// Subtract seconds from a [DateTime]
  DateTime subSeconds(int seconds) => subtract(Duration(seconds: seconds));

  /// Subtract years from a [DateTime]
  DateTime subYears(int years) => DateTime(
    year - years,
    month,
    day,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );
}

extension MayrDateTimeToStringExtensions on DateTime {
  /// Format [DateTime]
  String format(String format, {String? locale}) =>
      DateFormat(format, locale).format(this);

  /// Get ordinal of the day.
  String toDayOrdinal() {
    if (day >= 11 && day <= 13) return '${day}th';

    return switch (day % 10) {
      1 => '${day}st',
      2 => '${day}nd',
      3 => '${day}rd',
      _ => '${day}th',
    };
  }

  // Format [DateTime] to a time ago.
  String toTimeAgoString([String? locale]) =>
      GetTimeAgo.parse(this, locale: locale);

  /// Format [DateTime] to toTimeString - HH:mm or HH:mm:ss
  String toTimeString({bool withSeconds = false, String? locale}) =>
      format(withSeconds ? "HH:mm:ss" : "HH:mm", locale: locale);

  /// Format [DateTime] to a short date - example "Mon 1st Jan"
  String toShortDate([String? locale]) => [
    format("E", locale: locale),
    toDayOrdinal(),
    format('MMM', locale: locale),
  ].join(" ");
}
