import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  group('DateTime Manipulation Extensions', () {
    final baseDate = DateTime(2025, 1, 15, 10, 30, 45);

    group('Adding time units', () {
      test('addDays adds correct number of days', () {
        expect(baseDate.addDays(5), DateTime(2025, 1, 20, 10, 30, 45));
        expect(baseDate.addDays(-5), DateTime(2025, 1, 10, 10, 30, 45));
        expect(baseDate.addDays(0), baseDate);
      });

      test('addMonths adds correct number of months', () {
        expect(baseDate.addMonths(1), DateTime(2025, 2, 15, 10, 30, 45));
        expect(baseDate.addMonths(12), DateTime(2026, 1, 15, 10, 30, 45));
        expect(baseDate.addMonths(-1), DateTime(2024, 12, 15, 10, 30, 45));
      });

      test('addYears adds correct number of years', () {
        expect(baseDate.addYears(1), DateTime(2026, 1, 15, 10, 30, 45));
        expect(baseDate.addYears(10), DateTime(2035, 1, 15, 10, 30, 45));
        expect(baseDate.addYears(-5), DateTime(2020, 1, 15, 10, 30, 45));
      });

      test('addHours adds correct number of hours', () {
        expect(baseDate.addHours(2), DateTime(2025, 1, 15, 12, 30, 45));
        expect(baseDate.addHours(24), DateTime(2025, 1, 16, 10, 30, 45));
        expect(baseDate.addHours(-2), DateTime(2025, 1, 15, 8, 30, 45));
      });

      test('addMinutes adds correct number of minutes', () {
        expect(baseDate.addMinutes(30), DateTime(2025, 1, 15, 11, 0, 45));
        expect(baseDate.addMinutes(60), DateTime(2025, 1, 15, 11, 30, 45));
        expect(baseDate.addMinutes(-15), DateTime(2025, 1, 15, 10, 15, 45));
      });

      test('addSeconds adds correct number of seconds', () {
        expect(baseDate.addSeconds(15), DateTime(2025, 1, 15, 10, 31, 0));
        expect(baseDate.addSeconds(60), DateTime(2025, 1, 15, 10, 31, 45));
        expect(baseDate.addSeconds(-30), DateTime(2025, 1, 15, 10, 30, 15));
      });
    });

    group('Subtracting time units', () {
      test('subDays subtracts correct number of days', () {
        expect(baseDate.subDays(5), DateTime(2025, 1, 10, 10, 30, 45));
        expect(baseDate.subDays(15), DateTime(2024, 12, 31, 10, 30, 45));
        expect(baseDate.subDays(0), baseDate);
      });

      test('subMonths subtracts correct number of months', () {
        expect(baseDate.subMonths(1), DateTime(2024, 12, 15, 10, 30, 45));
        expect(baseDate.subMonths(12), DateTime(2024, 1, 15, 10, 30, 45));
        expect(baseDate.subMonths(0), baseDate);
      });

      test('subYears subtracts correct number of years', () {
        expect(baseDate.subYears(1), DateTime(2024, 1, 15, 10, 30, 45));
        expect(baseDate.subYears(5), DateTime(2020, 1, 15, 10, 30, 45));
        expect(baseDate.subYears(0), baseDate);
      });

      test('subHours subtracts correct number of hours', () {
        expect(baseDate.subHours(2), DateTime(2025, 1, 15, 8, 30, 45));
        expect(baseDate.subHours(11), DateTime(2025, 1, 14, 23, 30, 45));
        expect(baseDate.subHours(0), baseDate);
      });

      test('subMinutes subtracts correct number of minutes', () {
        expect(baseDate.subMinutes(15), DateTime(2025, 1, 15, 10, 15, 45));
        expect(baseDate.subMinutes(31), DateTime(2025, 1, 15, 9, 59, 45));
        expect(baseDate.subMinutes(0), baseDate);
      });

      test('subSeconds subtracts correct number of seconds', () {
        expect(baseDate.subSeconds(15), DateTime(2025, 1, 15, 10, 30, 30));
        expect(baseDate.subSeconds(46), DateTime(2025, 1, 15, 10, 29, 59));
        expect(baseDate.subSeconds(0), baseDate);
      });
    });
  });

  group('DateTime Check Extensions', () {
    test('isInFuture returns true for future dates', () {
      final futureDate = DateTime.now().add(Duration(days: 1));
      expect(futureDate.isInFuture, isTrue);
    });

    test('isInFuture returns false for past dates', () {
      final pastDate = DateTime.now().subtract(Duration(days: 1));
      expect(pastDate.isInFuture, isFalse);
    });

    test('isInPast returns true for past dates', () {
      final pastDate = DateTime.now().subtract(Duration(days: 1));
      expect(pastDate.isInPast, isTrue);
    });

    test('isInPast returns false for future dates', () {
      final futureDate = DateTime.now().add(Duration(days: 1));
      expect(futureDate.isInPast, isFalse);
    });

    test('isSameDay returns true for same day dates', () {
      final date1 = DateTime(2025, 1, 15, 10, 30);
      final date2 = DateTime(2025, 1, 15, 18, 45);
      expect(date1.isSameDay(date2), isTrue);
    });

    test('isSameDay returns false for different day dates', () {
      final date1 = DateTime(2025, 1, 15);
      final date2 = DateTime(2025, 1, 16);
      expect(date1.isSameDay(date2), isFalse);
    });

    test('isToday returns true for today', () {
      final today = DateTime.now();
      expect(today.isToday, isTrue);
    });

    test('isToday returns false for other days', () {
      final yesterday = DateTime.now().subtract(Duration(days: 1));
      expect(yesterday.isToday, isFalse);
    });

    test('isTomorrow returns true for tomorrow', () {
      final tomorrow = DateTime.now().add(Duration(days: 1));
      expect(tomorrow.isTomorrow, isTrue);
    });

    test('isTomorrow returns false for other days', () {
      final today = DateTime.now();
      expect(today.isTomorrow, isFalse);
    });

    test('isYesterday returns true for yesterday', () {
      final yesterday = DateTime.now().subtract(Duration(days: 1));
      expect(yesterday.isYesterday, isTrue);
    });

    test('isYesterday returns false for other days', () {
      final today = DateTime.now();
      expect(today.isYesterday, isFalse);
    });
  });

  group('DateTime Utility Extensions', () {
    test('startOfDay returns midnight of the same day', () {
      final date = DateTime(2025, 1, 15, 10, 30, 45);
      final startOfDay = date.startOfDay();
      expect(startOfDay, DateTime(2025, 1, 15, 0, 0, 0));
      expect(startOfDay.hour, 0);
      expect(startOfDay.minute, 0);
      expect(startOfDay.second, 0);
    });

    test('startOfDay works for dates at midnight', () {
      final midnight = DateTime(2025, 1, 15);
      expect(midnight.startOfDay(), midnight);
    });
  });

  group('DateTime Formatting Extensions', () {
    final testDate = DateTime(2025, 1, 15, 14, 30, 45);

    test('format returns correctly formatted date', () {
      expect(testDate.format('yyyy-MM-dd'), '2025-01-15');
      expect(testDate.format('dd/MM/yyyy'), '15/01/2025');
      expect(testDate.format('MMM dd, yyyy'), 'Jan 15, 2025');
    });

    test('toTimeString returns time without seconds by default', () {
      expect(testDate.toTimeString(), '14:30');
    });

    test('toTimeString returns time with seconds when specified', () {
      expect(testDate.toTimeString(withSeconds: true), '14:30:45');
    });

    test('toDayOrdinal returns correct ordinal suffix', () {
      expect(DateTime(2025, 1, 1).toDayOrdinal(), '1st');
      expect(DateTime(2025, 1, 2).toDayOrdinal(), '2nd');
      expect(DateTime(2025, 1, 3).toDayOrdinal(), '3rd');
      expect(DateTime(2025, 1, 4).toDayOrdinal(), '4th');
      expect(DateTime(2025, 1, 11).toDayOrdinal(), '11th');
      expect(DateTime(2025, 1, 12).toDayOrdinal(), '12th');
      expect(DateTime(2025, 1, 13).toDayOrdinal(), '13th');
      expect(DateTime(2025, 1, 21).toDayOrdinal(), '21st');
      expect(DateTime(2025, 1, 22).toDayOrdinal(), '22nd');
      expect(DateTime(2025, 1, 23).toDayOrdinal(), '23rd');
      expect(DateTime(2025, 1, 31).toDayOrdinal(), '31st');
    });

    test('toShortDate returns formatted short date', () {
      // Format is "E (day ordinal) MMM"
      final result = testDate.toShortDate();
      expect(result, contains('Wed'));
      expect(result, contains('15th'));
      expect(result, contains('Jan'));
    });

    test('toTimeAgoString returns time ago format', () {
      final recentDate = DateTime.now().subtract(Duration(minutes: 5));
      final result = recentDate.toTimeAgoString();
      expect(result, isNotEmpty);
      // The exact format depends on the get_time_ago package
    });
  });

  group('DateTime Time of Day Extensions', () {
    test('isNight returns true for night hours (0-6)', () {
      expect(DateTime(2025, 1, 15, 0, 0).isNight, isTrue);
      expect(DateTime(2025, 1, 15, 3, 30).isNight, isTrue);
      expect(DateTime(2025, 1, 15, 5, 59).isNight, isTrue);
      expect(DateTime(2025, 1, 15, 6, 0).isNight, isFalse);
    });

    test('isMorning returns true for morning hours (0-12)', () {
      expect(DateTime(2025, 1, 15, 0, 0).isMorning, isTrue);
      expect(DateTime(2025, 1, 15, 6, 0).isMorning, isTrue);
      expect(DateTime(2025, 1, 15, 11, 59).isMorning, isTrue);
      expect(DateTime(2025, 1, 15, 12, 0).isMorning, isFalse);
    });

    test('isAfternoon returns true for afternoon hours (12-18)', () {
      expect(DateTime(2025, 1, 15, 12, 0).isAfternoon, isTrue);
      expect(DateTime(2025, 1, 15, 15, 30).isAfternoon, isTrue);
      expect(DateTime(2025, 1, 15, 17, 59).isAfternoon, isTrue);
      expect(DateTime(2025, 1, 15, 18, 0).isAfternoon, isFalse);
    });

    test('isEvening returns true for evening hours (18-24)', () {
      expect(DateTime(2025, 1, 15, 18, 0).isEvening, isTrue);
      expect(DateTime(2025, 1, 15, 20, 30).isEvening, isTrue);
      expect(DateTime(2025, 1, 15, 23, 59).isEvening, isTrue);
      expect(DateTime(2025, 1, 15, 0, 0).isEvening, isFalse);
    });
  });

  group('DateTime Age Extensions', () {
    test('toAge returns correct age', () {
      final birthDate = DateTime.now().subtract(Duration(days: 365 * 25));
      expect(birthDate.toAge(), 25);
    });

    test('isAgeEqualTo returns true for matching age', () {
      final birthDate = DateTime.now().subtract(Duration(days: 365 * 30));
      expect(birthDate.isAgeEqualTo(30), isTrue);
      expect(birthDate.isAgeEqualTo(25), isFalse);
    });

    test('isAgeOlder returns true when age is greater', () {
      final birthDate = DateTime.now().subtract(Duration(days: 365 * 30));
      expect(birthDate.isAgeOlder(25), isTrue);
      expect(birthDate.isAgeOlder(30), isFalse);
      expect(birthDate.isAgeOlder(35), isFalse);
    });

    test('isAgeYounger returns true when age is less', () {
      final birthDate = DateTime.now().subtract(Duration(days: 365 * 30));
      expect(birthDate.isAgeYounger(35), isTrue);
      expect(birthDate.isAgeYounger(30), isFalse);
      expect(birthDate.isAgeYounger(25), isFalse);
    });

    test('isAgeBetween returns true when age is in range', () {
      final birthDate = DateTime.now().subtract(Duration(days: 365 * 30));
      expect(birthDate.isAgeBetween(25, 35), isTrue);
      expect(birthDate.isAgeBetween(30, 35), isTrue);
      expect(birthDate.isAgeBetween(25, 30), isTrue);
      expect(birthDate.isAgeBetween(20, 25), isFalse);
      expect(birthDate.isAgeBetween(35, 40), isFalse);
    });
  });
}
