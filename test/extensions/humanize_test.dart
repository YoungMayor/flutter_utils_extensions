import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  group('Duration Humanize Extensions', () {
    test('humanize formats duration correctly', () {
      expect(Duration(hours: 2, minutes: 3).humanize(), '2 hours, 3 minutes');
      expect(Duration(days: 1).humanize(), '1 day');
      expect(Duration(seconds: 45).humanize(), '45 seconds');
      expect(Duration(hours: 1, minutes: 30).humanize(), '1 hour, 30 minutes');
      expect(
        Duration(days: 2, hours: 3, minutes: 15).humanize(),
        '2 days, 3 hours, and 15 minutes',
      );
    });

    test('humanize handles zero duration', () {
      expect(Duration.zero.humanize(), '0 seconds');
    });

    test('humanize handles single units', () {
      expect(Duration(days: 1).humanize(), '1 day');
      expect(Duration(hours: 1).humanize(), '1 hour');
      expect(Duration(minutes: 1).humanize(), '1 minute');
      expect(Duration(seconds: 1).humanize(), '1 second');
    });
  });

  group('DateTime Humanize Extensions', () {
    test('humanize returns "just now" for recent time', () {
      final now = DateTime.now();
      expect(now.humanize(), 'just now');
    });

    test('humanize formats past times correctly', () {
      final now = DateTime.now();

      // Use a time far enough in the past to avoid timing issues
      final fiveMinutesAgo = now.subtract(Duration(minutes: 5, seconds: 30));
      final result = fiveMinutesAgo.humanize();
      expect(result == '5 minutes ago' || result == '6 minutes ago', true);

      // Add extra seconds to avoid boundary timing issues
      final threeHoursAgo = now.subtract(Duration(hours: 3, seconds: 30));
      final hoursResult = threeHoursAgo.humanize();
      expect(
        hoursResult == '3 hours ago' || hoursResult == '4 hours ago',
        true,
      );

      expect(now.subtract(Duration(days: 1)).humanize(), 'yesterday');
      expect(now.subtract(Duration(days: 3)).humanize(), '3 days ago');
      expect(now.subtract(Duration(days: 10)).humanize(), 'last week');
    });

    test('humanize formats future times correctly', () {
      final now = DateTime.now();

      // Use a time far enough in the future to avoid timing issues
      final fiveMinutesLater = now.add(Duration(minutes: 5, seconds: 30));
      final result = fiveMinutesLater.humanize();
      expect(result == 'in 5 minutes' || result == 'in 6 minutes', true);

      // Add extra seconds to avoid boundary timing issues
      final threeHoursLater = now.add(Duration(hours: 3, seconds: 30));
      final hoursResult = threeHoursLater.humanize();
      expect(hoursResult == 'in 3 hours' || hoursResult == 'in 4 hours', true);

      expect(now.add(Duration(days: 1, seconds: 1)).humanize(), 'tomorrow');
      expect(now.add(Duration(days: 3, seconds: 1)).humanize(), 'in 3 days');
      expect(now.add(Duration(days: 10, seconds: 1)).humanize(), 'next week');
    });

    test('humanize handles singular values', () {
      final now = DateTime.now();

      // Add buffer seconds to avoid timing boundary issues
      final oneMinuteAgo = now.subtract(Duration(minutes: 1, seconds: 30));
      final minuteAgoResult = oneMinuteAgo.humanize();
      expect(
        minuteAgoResult == '1 minute ago' || minuteAgoResult == '2 minutes ago',
        true,
      );

      final oneHourAgo = now.subtract(Duration(hours: 1, seconds: 30));
      final hourAgoResult = oneHourAgo.humanize();
      expect(
        hourAgoResult == '1 hour ago' || hourAgoResult == '2 hours ago',
        true,
      );

      final oneMinuteLater = now.add(Duration(minutes: 1, seconds: 30));
      final minuteLaterResult = oneMinuteLater.humanize();
      expect(
        minuteLaterResult == 'in 1 minute' ||
            minuteLaterResult == 'in 2 minutes',
        true,
      );

      final oneHourLater = now.add(Duration(hours: 1, seconds: 30));
      final hourLaterResult = oneHourLater.humanize();
      expect(
        hourLaterResult == 'in 1 hour' || hourLaterResult == 'in 2 hours',
        true,
      );
    });
  });

  group('Num Humanize Extensions', () {
    test('humanizeNumber formats numbers correctly', () {
      expect(999.humanizeNumber(), '999');
      expect(1234.humanizeNumber(), '1.2k');
      expect(1500000.humanizeNumber(), '1.5M');
      expect(1000000000.humanizeNumber(), '1B');
      expect(1100000000.humanizeNumber(), '1.1B');
    });

    test('humanizeNumber handles decimals', () {
      expect(1500.humanizeNumber(decimals: 2), '1.50k');
      expect(1234567.humanizeNumber(decimals: 0), '1M');
    });

    test('humanizeOrdinal formats ordinals correctly', () {
      expect(1.humanizeOrdinal(), '1st');
      expect(2.humanizeOrdinal(), '2nd');
      expect(3.humanizeOrdinal(), '3rd');
      expect(4.humanizeOrdinal(), '4th');
      expect(11.humanizeOrdinal(), '11th');
      expect(12.humanizeOrdinal(), '12th');
      expect(13.humanizeOrdinal(), '13th');
      expect(21.humanizeOrdinal(), '21st');
      expect(22.humanizeOrdinal(), '22nd');
      expect(23.humanizeOrdinal(), '23rd');
      expect(101.humanizeOrdinal(), '101st');
    });

    test('humanizeCount formats counts correctly', () {
      expect(0.humanizeCount('item'), '0 items');
      expect(1.humanizeCount('item'), '1 item');
      expect(3.humanizeCount('item'), '3 items');
      expect(2.humanizeCount('person', pluralName: 'people'), '2 people');
    });

    test('humanizePercentage formats percentages correctly', () {
      expect(0.75.humanizePercentage(), '75%');
      expect(0.5.humanizePercentage(), '50%');
      expect(50.humanizePercentage(max: 100), '50%');
      expect(0.333.humanizePercentage(decimals: 1), '33.3%');
    });

    test('humanizeFileSize formats file sizes correctly', () {
      expect(0.humanizeFileSize(), '0 B');
      expect(500.humanizeFileSize(), '500 B');
      expect(1024.humanizeFileSize(), '1 KB');
      expect(1025.humanizeFileSize(), '1.0 KB');
      expect(1126.humanizeFileSize(), '1.1 KB');
      expect(1048576.humanizeFileSize(), '1 MB');
      expect(520300.humanizeFileSize(), '508.1 KB');
      expect(1073741824.humanizeFileSize(), '1 GB');
    });

    test('humanizeFileSize handles decimals', () {
      expect(1536.humanizeFileSize(decimals: 2), '1.50 KB');
      expect(1024.humanizeFileSize(decimals: 0), '1 KB');
    });

    test('humanizeFileSize handles invalid sizes', () {
      expect((-100).humanizeFileSize(), 'Invalid size');
    });
  });
}
