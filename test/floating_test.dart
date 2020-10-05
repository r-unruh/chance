import 'package:test/test.dart';

import 'package:chance/chance.dart';

void main() {

  test('reaches min', () {
    var reachedMin = false;

    for (var i = 0; i < 5000000; ++i)
      if (Chance.floating(min: -10, max: 10) <= -9.999) {
        reachedMin = true;
        break;
      }

    expect(reachedMin, isTrue);
  });

  test('reaches max', () {
    var reachedMax = false;

    for (var i = 0; i < 5000000; ++i)
      if (Chance.floating(min: -10, max: 10) >= 9.999) {
        reachedMax = true;
        break;
      }

    expect(reachedMax, isTrue);
  });

  test('respects limits', () {
    for (var i = 0; i < 100000; ++i)
      expect(Chance.floating(min: 0, max: 20.5), allOf(lessThan(20.5000001), greaterThan(-.0000001)));
  });

  test('works without min', () {
    var reachedMax = false;

    for (var i = 0; i < 100000; ++i) {
      final number = Chance.floating(max: 10);
      if (number >= 9.99)
        reachedMax = true;
      expect(number, greaterThanOrEqualTo(0));
    }

    expect(reachedMax, isTrue);
  });

  test('works without arguments', () {
    for (var i = 0; i < 100000; ++i)
      expect(Chance.floating(), allOf(greaterThanOrEqualTo(0), lessThanOrEqualTo(1)));
  });

  test('minMax works', () {
    var reachedMin = false;
    var reachedMax = false;

    for (var i = 0; i < 100000; ++i) {
      final number = Chance.floating(minMax: 100);

      if (number < -99)
        reachedMin = true;
      else if (number > 99)
        reachedMax = true;
    }

    expect(reachedMin, isTrue);
    expect(reachedMax, isTrue);
  });

  test('throws error on invalid arguments', () {
    expect(() {Chance.floating(min: 10);}, throwsArgumentError);
    expect(() {Chance.floating(min: 10, minMax: 10);}, throwsArgumentError);
    expect(() {Chance.floating(max: 10, minMax: 10);}, throwsArgumentError);
    expect(() {Chance.floating(min: 10, max: 5, minMax: 10);}, throwsArgumentError);
  });

  test('throws error on min > max', () {
    expect(() {Chance.floating(min: 10, max: 5);}, throwsRangeError);
  });

  // TODO: Add test that proves an even distribution.
}
