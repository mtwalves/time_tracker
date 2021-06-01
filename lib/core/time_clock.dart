import './extensions/list.dart';

class TimeClock {
  late DateTime day;
  List<DateTime> punches = [];
  Duration workload;

  TimeClock([this.workload = const Duration(hours: 8)]) {
    day = DateTime.now();
  }

  void punch() => punches.add(DateTime.now());

  Duration get overtime => workedTime - workload;

  Duration get workedTime {
    List<List<DateTime>> punchInsAndPunchOuts = punches.chunk();

    return punchInsAndPunchOuts.fold(Duration.zero, _sumPunches);
  }

  Duration _sumPunches(Duration sum, List<DateTime> punchInAndPunchOut) {
    return sum += punchInAndPunchOut.last.difference(punchInAndPunchOut.first);
  }
}
