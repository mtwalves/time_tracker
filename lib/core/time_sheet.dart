import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'time_clock.dart';

class TimeSheet extends ChangeNotifier {
  List<TimeClock> _days = [];

  List<TimeClock> get days => _days;

  TimeClock get today {
    TimeClock timeClock;

    if (_days.isEmpty) {
      timeClock = TimeClock();
      _days.add(timeClock);
    } else {
      Duration difference = DateTime.now().difference(_days.last.day);

      if (difference.inDays >= 1) {
        timeClock = TimeClock();
        _days.add(timeClock);
      } else {
        timeClock = _days.last;
      }
    }

    return timeClock;
  }

  void punch(TimeOfDay time) {
    DateTime now = DateTime.now();
    DateTime date =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    today.punch(date);

    notifyListeners();
  }

  Duration get overtime {
    return _days.fold(Duration.zero, _sumOvertime);
  }

  Duration _sumOvertime(Duration sum, TimeClock day) => sum += day.overtime;
}
