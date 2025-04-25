part of './../extensions.dart';

extension DateTimeChecksExtensions on DateTime {
  static DateTime get _now => DateTime.now();

  static DateTime get _tomorrow => DateTime.now().addDays(1);

  static DateTime get _yesterday => DateTime.now().subDays(1);

  /// Check if the date is in the afternoon.
  bool isAfternoon() => hour >= 12 && hour < 18;

  /// Check if [DateTime] is between a certain [min] and [max] age
  bool isAgeBetween(int min, int max) => toAge() >= min && toAge() <= max;

  /// Check if [DateTime] is equal to a certain [age]
  bool isAgeEqualTo(int age) => toAge() == age;

  /// Check if [DateTime] is older than a certain [age]
  bool isAgeOlder(int age) => toAge() > age;

  /// Check if [DateTime] is younger than a certain [age]
  bool isAgeYounger(int age) => toAge() < age;

  /// Check if the date is in the evening.
  bool isEvening() => hour >= 18 && hour < 24;

  /// Check if the date is still valid.
  bool isExpired() => isInPast();

  /// Check if [DateTime] is in the future
  bool isInFuture() => isAfter(DateTime.now());

  /// Check if [DateTime] is in the past
  bool isInPast() => isBefore(DateTime.now());

  /// Check if the date is in the morning.
  bool isMorning() => hour >= 0 && hour < 12;

  /// Check if the date is in the night.
  bool isNight() => hour >= 0 && hour < 6;

  bool isSameDay(DateTime otherDate) =>
      day == otherDate.day &&
      month == otherDate.month &&
      year == otherDate.year;

  /// Check if [DateTime] is today
  bool isToday() => isSameDay(_now);

  /// Check if [DateTime] is tomorrow
  bool isTomorrow() => isSameDay(_tomorrow);

  /// Check if [DateTime] is yesterday
  bool isYesterday() => isSameDay(_yesterday);
}

extension DateTimeExtensions on DateTime {}

extension DateTimeManipulationExtensions on DateTime {
  /// Add days to a [DateTime]
  DateTime addDays(int days) => add(Duration(days: days));

  /// Add hours to a [DateTime]
  DateTime addHours(int hours) => add(Duration(hours: hours));

  /// Add minutes to a [DateTime]
  DateTime addMinutes(int minutes) => add(Duration(minutes: minutes));

  /// Add months to a [DateTime]
  DateTime addMonths(int months) => DateTime(year, month + months, day);

  /// Add seconds to a [DateTime]
  DateTime addSeconds(int seconds) => add(Duration(seconds: seconds));

  /// Add years to a [DateTime]
  DateTime addYears(int years) => DateTime(year + years, month, day);

  /// Subtract days from a [DateTime]
  DateTime subDays(int days) => subtract(Duration(days: days));

  /// Subtract hours from a [DateTime]
  DateTime subHours(int hours) => subtract(Duration(hours: hours));

  /// Subtract minutes from a [DateTime]
  DateTime subMinutes(int minutes) => subtract(Duration(minutes: minutes));

  /// Subtract months from a [DateTime]
  DateTime subMonths(int months) => DateTime(year, month - months, day);

  /// Subtract seconds from a [DateTime]
  DateTime subSeconds(int seconds) => subtract(Duration(seconds: seconds));

  /// Subtract years from a [DateTime]
  DateTime subYears(int years) => DateTime(year - years, month, day);
}

extension DateTimeToStringExtensions on DateTime {
  /// Format [DateTime] to an age
  int toAge() => DateTime.now().difference(this).inDays ~/ 365;

  /// Format [DateTime] to toDateString - yyyy-MM-dd
  String toDateString({String format = "yyyy-MM-dd", String? locale}) =>
      toFormat(format, locale: locale);

  /// Format [DateTime] to toDateString - yyyy-MM-dd
  String toDateStringUK({String format = "dd/MM/yyyy", String? locale}) =>
      toFormat(format, locale: locale);

  /// Format [DateTime] to toDateString - yyyy-MM-dd
  String toDateStringUS({String format = "MM/dd/yyyy", String? locale}) =>
      toFormat(format, locale: locale);

  /// Format [DateTime] to DateTimeString - yyyy-MM-dd HH:mm:ss
  String toDateTimeString(String? locale) =>
      toFormat("yyyy-MM-dd HH:mm:ss", locale: locale);

  /// Format [DateTime]
  String toFormat(String format, {String? locale}) =>
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
      toFormat(withSeconds ? "HH:mm:ss" : "HH:mm", locale: locale);

  /// Format [DateTime] to a short date - example "Mon 1st Jan"
  String toShortDate([String? locale]) => [
    toFormat("E", locale: locale),
    toDayOrdinal(),
    toFormat('MMM', locale: locale),
  ].join(" ");
}
