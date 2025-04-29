import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/src/extensions.dart';

void main() {
  group("Time of Day Tests", () {
    DateTime startOfDay = DateTime.now().startOfDay();

    test("Test is morning", () {
      expect(startOfDay.isMorning, isTrue);

      expect(startOfDay.addHours(11).isMorning, isTrue);
      expect(startOfDay.addHours(11).addMinutes(59).isMorning, isTrue);

      expect(startOfDay.addHours(12).isMorning, isFalse);
    });

    test("Test is afternoon", () {
      expect(startOfDay.isAfternoon, isFalse);

      expect(startOfDay.addHours(12).isAfternoon, isTrue);
      expect(startOfDay.addHours(17).isAfternoon, isTrue);
      expect(startOfDay.addHours(17).addMinutes(59).isAfternoon, isTrue);

      expect(startOfDay.addHours(18).isAfternoon, isFalse);
    });

    test("Test is evening", () {
      expect(startOfDay.isEvening, isFalse);

      expect(startOfDay.addHours(18).isEvening, isTrue);
      expect(startOfDay.addHours(23).isEvening, isTrue);
      expect(startOfDay.addHours(23).addMinutes(59).isEvening, isTrue);

      expect(startOfDay.addHours(24).isEvening, isFalse);
    });

    test("Test is night", () {
      expect(startOfDay.isNight, isTrue);

      expect(startOfDay.addHours(5).isNight, isTrue);
      expect(startOfDay.addHours(5).addMinutes(59).isNight, isTrue);

      expect(startOfDay.addHours(6).isNight, isFalse);
    });
  });
}
