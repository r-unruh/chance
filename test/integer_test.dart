import 'package:test/test.dart';

import 'package:chance/chance.dart';

void main() {
  final chance = Chance();

  test('includes min', () {
    var reachedMin = false;

    for (var i = 0; i < 1000000; ++i)
      if (chance.integer(min: -10, max: 10) == -10) {
        reachedMin = true;
        break;
      }

    expect(reachedMin, isTrue);
  });

  test('includes max', () {
    var reachedMax = false;

    for (var i = 0; i < 1000000; ++i)
      if (chance.integer(min: -10, max: 10) == 10) {
        reachedMax = true;
        break;
      }

    expect(reachedMax, isTrue);
  });

  test('respects limits', () {
    for (var i = 0; i < 100000; ++i)
      expect(chance.integer(min: 0, max: 20), allOf(lessThan(21), greaterThan(-1)));
  });

  test('works without min', () {
    var reachedMax = false;

    for (var i = 0; i < 100000; ++i) {
      final number = chance.integer(max: 10);
      if (number == 10)
        reachedMax = true;
      expect(number, greaterThanOrEqualTo(0));
    }

    expect(reachedMax, isTrue);
  });

  test('throws error on invalid arguments', () {
    expect(() {chance.integer(min: 10);}, throwsArgumentError);
    expect(() {chance.integer(min: 10, minMax: 10);}, throwsArgumentError);
    expect(() {chance.integer(max: 10, minMax: 10);}, throwsArgumentError);
    expect(() {chance.integer(min: 10, max: 5, minMax: 10);}, throwsArgumentError);
  });

  test('throws error on min > max', () {
    expect(() {chance.integer(min: 10, max: 5);}, throwsRangeError);
  });

  // TODO: Add test that proves an even distribution.
}
