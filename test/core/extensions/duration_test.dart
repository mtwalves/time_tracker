import 'package:test/test.dart';

import 'package:time_tracker/core/extensions/duration.dart';

void main() {
  group('Duration extensions:', () {
    group('should return duration in HH:mm format', () {
      test('and have leading zero', () {
        String expected = '01:01';
        String actual = Duration(minutes: 61).inHHmm();

        expect(actual, expected);
      });

      test('and support three digits', () {
        String expected = '999:00';
        String actual = Duration(hours: 999).inHHmm();

        expect(actual, expected);
      });

      test('and support four digits', () {
        String expected = '9999:00';
        String actual = Duration(hours: 9999).inHHmm();

        expect(actual, expected);
      });
    });

    group('should return negative duration in HH:mm format', () {
      test('and have leading zero', () {
        String expected = '-01:01';
        String actual = Duration(minutes: -61).inHHmm();

        expect(actual, expected);
      });

      test('and support three digits', () {
        String expected = '-999:01';
        String actual = Duration(hours: -999, minutes: -1).inHHmm();

        expect(actual, expected);
      });

      test('and support four digits', () {
        String expected = '-9999:01';
        String actual = Duration(hours: -9999, minutes: -1).inHHmm();

        expect(actual, expected);
      });
    });
  });
}
