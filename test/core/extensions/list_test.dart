import 'package:test/test.dart';

import 'package:time_tracker/core/extensions/list.dart';

void main() {
  group('Chunk extension:', () {
    group('empty list', () {
      test('should NOT chunk', () {
        List<int> list = List.empty();
        List<List<int>> expected = List.empty();
        List<List<int>> result = list.chunk();

        expect(result, expected);
      });
    });
    group('even length list', () {
      test('should chunk with default length', () {
        List<int> list = [1, 2, 3, 4, 5, 6];
        List<List<int>> expected = [
          [1, 2],
          [3, 4],
          [5, 6]
        ];
        List<List<int>> result = list.chunk();

        expect(result, expected);
      });

      test('should chunk with custom length', () {
        List<int> list = [1, 2, 3, 4, 5, 6];
        List<List<int>> expected = [
          [1, 2, 3],
          [4, 5, 6],
        ];
        List<List<int>> result = list.chunk(3);

        expect(result, expected);
      });
    });

    group('odd length list', () {
      test('should chunk with default length', () {
        List<int> list = [1, 2, 3, 4, 5, 6, 7];
        List<List<int>> expected = [
          [1, 2],
          [3, 4],
          [5, 6]
        ];
        List<List<int>> result = list.chunk();

        expect(result, expected);
      });

      test('should chunk with custom length', () {
        List<int> list = [1, 2, 3, 4, 5, 6, 7];
        List<List<int>> expected = [
          [1, 2, 3],
          [4, 5, 6],
        ];
        List<List<int>> result = list.chunk(3);

        expect(result, expected);
      });
    });
  });
}
