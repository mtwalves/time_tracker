import 'package:test/test.dart';

import 'package:time_tracker/core/time_clock.dart';

void main() {
  group('Time Clock:', () {
    group('worked hours', () {
      test('should get worked hours (4 punches)', () {
        TimeClock timeClock = TimeClock();
        timeClock.punches.add(DateTime(2020, 1, 1, 8, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 12, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 13, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 17, 0));

        expect(timeClock.workedTime.inMinutes, 480);
        expect(timeClock.punches.length, 4); // check for side effects
      });

      test('should get worked hours (3 punches)', () {
        TimeClock timeClock = TimeClock();
        timeClock.punches.add(DateTime(2020, 1, 1, 8, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 12, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 13, 0));

        expect(timeClock.workedTime.inMinutes, 240);
        expect(timeClock.punches.length, 3); // check for side effects
      });

      test('should get worked hours (2 punches)', () {
        TimeClock timeClock = TimeClock();
        timeClock.punches.add(DateTime(2020, 1, 1, 8, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 12, 0));

        expect(timeClock.workedTime.inMinutes, 240);
        expect(timeClock.punches.length, 2); // check for side effects
      });

      test('should get worked hours (1 punches)', () {
        TimeClock timeClock = TimeClock();

        expect(timeClock.workedTime.inMinutes, 0);
        expect(timeClock.punches.length, 0); // check for side effects
      });

      test('should get worked hours (0 punches)', () {
        TimeClock timeClock = TimeClock();

        expect(timeClock.workedTime.inMinutes, 0);
        expect(timeClock.punches.length, 0); // check for side effects
      });
    });

    group('overtime', () {
      test('should get overtime (0 hours)', () {
        TimeClock timeClock = TimeClock();
        timeClock.punches.add(DateTime(2020, 1, 1, 8, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 12, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 13, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 17, 0));

        expect(timeClock.overtime.inHours, 0);
        expect(timeClock.punches.length, 4); // check for side effects
      });

      test('should get overtime (2 hours)', () {
        TimeClock timeClock = TimeClock();
        timeClock.punches.add(DateTime(2020, 1, 1, 8, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 12, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 13, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 19, 0));

        expect(timeClock.overtime.inHours, 2);
        expect(timeClock.punches.length, 4); // check for side effects
      });

      test('should get overtime (-30 minutes)', () {
        TimeClock timeClock = TimeClock();
        timeClock.punches.add(DateTime(2020, 1, 1, 8, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 12, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 13, 0));
        timeClock.punches.add(DateTime(2020, 1, 1, 16, 30));

        expect(timeClock.overtime.inMinutes, -30);
        expect(timeClock.punches.length, 4); // check for side effects
      });
    });
  });
}
