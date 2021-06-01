import 'package:test/test.dart';

import 'package:time_tracker/core/time_clock.dart';
import 'package:time_tracker/core/time_sheet.dart';

void main() {
  group('Time Sheet:', () {
    group('.today', () {
      test("should return an already created TimeClock if it's the same day",
          () {
        TimeSheet timeSheet = TimeSheet();
        TimeClock firstTimeClock = timeSheet.today;
        TimeClock secondTimeClock = timeSheet.today;

        assert(identical(firstTimeClock, secondTimeClock));
      });

      test('should return another TimeClock if the day has changed', () {
        TimeClock mockedTimeClock = TimeClock();
        mockedTimeClock.day = DateTime(2000);

        TimeSheet timeSheet = TimeSheet();
        timeSheet.days.add(mockedTimeClock);

        TimeClock timeClock = timeSheet.today;

        assert(!identical(timeClock, mockedTimeClock));
      });
    });
    group('.overtime', () {
      test('should return total overtime', () {
        TimeSheet timeSheet = TimeSheet();

        TimeClock oldTimeClock = TimeClock();
        oldTimeClock.day = DateTime(2000, 01, 01);
        oldTimeClock.punches.add(DateTime(2000, 01, 01, 9, 0));
        oldTimeClock.punches.add(DateTime(2000, 01, 01, 12, 0));
        oldTimeClock.punches.add(DateTime(2000, 01, 01, 13, 0));
        oldTimeClock.punches.add(DateTime(2000, 01, 01, 18, 0));
        timeSheet.days.add(oldTimeClock);

        TimeClock todayTimeClock = timeSheet.today;
        DateTime today = todayTimeClock.day;
        todayTimeClock.punches
            .add(DateTime(today.year, today.month, today.day, 7, 0));
        todayTimeClock.punches
            .add(DateTime(today.year, today.month, today.day, 12, 0));
        todayTimeClock.punches
            .add(DateTime(today.year, today.month, today.day, 13, 0));
        todayTimeClock.punches
            .add(DateTime(today.year, today.month, today.day, 20, 0));

        expect(timeSheet.overtime.inHours, 4);
      });
    });
  });
}
