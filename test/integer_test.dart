import 'package:test/test.dart';

import 'package:chance/chance.dart';

void main() {

  test('includes min', () {
    var reachedMin = false;

    for (var i = 0; i < 1000000; ++i)
      if (Chance.integer(min: -10, max: 10) == -10) {
        reachedMin = true;
        break;
      }

    expect(reachedMin, isTrue);
  });

  test('includes max', () {
    var reachedMax = false;

    for (var i = 0; i < 1000000; ++i)
      if (Chance.integer(min: -10, max: 10) == 10) {
        reachedMax = true;
        break;
      }

    expect(reachedMax, isTrue);
  });

  test('respects limits', () {
    for (var i = 0; i < 100000; ++i)
      expect(Chance.integer(min: 0, max: 20), allOf(lessThan(21), greaterThan(-1)));
  });

  test('works without min', () {
    var reachedMax = false;

    for (var i = 0; i < 100000; ++i) {
      final number = Chance.integer(max: 10);
      if (number == 10)
        reachedMax = true;
      expect(number, greaterThanOrEqualTo(0));
    }

    expect(reachedMax, isTrue);
  });

  test('throws error on invalid arguments', () {
    expect(() {Chance.integer(min: 10);}, throwsArgumentError);
    expect(() {Chance.integer(min: 10, minMax: 10);}, throwsArgumentError);
    expect(() {Chance.integer(max: 10, minMax: 10);}, throwsArgumentError);
    expect(() {Chance.integer(min: 10, max: 5, minMax: 10);}, throwsArgumentError);
  });

  test('throws error on min > max', () {
    expect(() {Chance.integer(min: 10, max: 5);}, throwsRangeError);
  });

  // TODO: Add test that proves an even distribution.
}
