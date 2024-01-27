import 'package:test/test.dart';
import 'package:chance/chance.dart';

void main() {
  group('picks from whole pool', () {
    final pool = [1, 2, 3, 4, 5];

    test('randomItem', () {
      final picked = <int>{};
      for (var i = 0; i < 1000; ++i)
        picked.add(randomItem(pool));
      expect(picked, containsAll(pool));
    });

    test('randomItemOrNull', () {
      final picked = <int>{};
      for (var i = 0; i < 1000; ++i)
        picked.add(randomItemOrNull(pool)!);
      expect(picked, containsAll(pool));
    });
  });

  test('empty iterables', () {
    expect(() => randomItem([]), throwsArgumentError);
    expect(randomItemOrNull([]), isNull);
  });

  test('works with different kinds of iterables', () {
    expect(randomItem([1, 2, 3]), inInclusiveRange(1, 3));
    expect(randomItem({1, 2, 3}), inInclusiveRange(1, 3));
  });
}
