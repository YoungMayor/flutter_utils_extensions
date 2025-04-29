import 'package:mayr_extensions/mayr_extensions.dart';

void dateTime(DateTime dateTime) {
  int min = 0;
  int max = 0;
  int age = 0;
  DateTime otherDate = DateTime.now();
  int val = 0;

  // Time Of Day

  dateTime.isMorning; // 12noon to 12pm
  dateTime.isAfternoon; // 12pm to 6pm
  dateTime.isEvening; // 6pm to 12noon
  dateTime.isNight; // 12noon to 6am

  // Age

  dateTime.toAge(); // Returns the age in years
  dateTime.isAgeBetween(min, max);
  dateTime.isAgeEqualTo(age);
  dateTime.isAgeOlder(age);
  dateTime.isAgeYounger(age);

  dateTime.isExpired || dateTime.isInFuture || dateTime.isInPast;

  dateTime.isSameDay(otherDate);

  dateTime.isToday || dateTime.isTomorrow || dateTime.isYesterday;

  // Additions

  dateTime.addSeconds(val);
  dateTime.addMinutes(val);
  dateTime.addHours(val);
  dateTime.addDays(val);
  dateTime.addMonths(val);
  dateTime.addYears(val);

  // Subtractions

  dateTime.subSeconds(val);
  dateTime.subMinutes(val);
  dateTime.subHours(val);
  dateTime.subDays(val);
  dateTime.subMonths(val);
  dateTime.subYears(val);

  // String castings

  dateTime.format("yyyy-MM-dd"); // String according to given formats
  // Common formats included in `MayrDateTimeFormats` class

  dateTime.toDayOrdinal(); // 1st, 2nd, 3rd ...
  dateTime.toTimeAgoString(); // x time ago, x time from now
  dateTime.toShortDate(); // Mon 1st Jan
}
