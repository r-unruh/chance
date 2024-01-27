import 'package:test/test.dart';
import 'package:chance/chance.dart';

void main() {
  group('integer', () {
    test('includes min', () {
      for (var i = 0; i < 5000000; ++i)
        if (randomInt(-10, 10) == -10)
          return;
      fail('min not reached');
    });

    test('includes max', () {
      for (var i = 0; i < 5000000; ++i)
        if (randomInt(-10, 10) == 10)
          return;
      fail('max not reached');
    });

    test('respects limits', () {
      for (var i = 0; i < 100000; ++i)
        expect(randomInt(0, 20), inInclusiveRange(0, 20));
    });

    test('throws error on min > max', () {
      expect(() => randomInt(9, 5), throwsRangeError);
    });
  });

  group('double', () {
    test('reaches min', () {
      for (var i = 0; i < 5000000; ++i)
        if (randomDouble(-10, 10) <= -9.999)
          return;
      fail('min not reached');
    });

    test('reaches max', () {
      for (var i = 0; i < 5000000; ++i)
        if (randomDouble(-10, 10) >= 9.999)
          return;
      fail('max not reached');
    });

    test('respects limits', () {
      for (var i = 0; i < 100000; ++i)
        expect(randomDouble(0, 20.5), inInclusiveRange(-.0000001, 20.5000001));
    });

    test('throws error on min > max', () {
      expect(() => randomDouble(9, 5), throwsRangeError);
    });
  });
}
