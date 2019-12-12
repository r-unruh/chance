import 'package:test/test.dart';

import 'package:chance/chance.dart';

void main() {
  final chance = Chance();

  test('without argument', () {
    var trueCount = 0;

    for (var i = 0; i < 100000; ++i)
      if (chance.boolean())
        ++trueCount;

    expect(trueCount, greaterThan(20000));
    expect(trueCount, lessThan(80000));
  });

  test('more likely', () {
    var trueCount = 0;
    var falseCount = 0;

    for (var i = 0; i < 100000; ++i) {
      if (chance.boolean(likelihood: 60))
        ++trueCount;
      else
        ++falseCount;
    }

    expect(trueCount, greaterThan(falseCount));
  });

  test('less likely', () {
    var trueCount = 0;
    var falseCount = 0;

    for (var i = 0; i < 100000; ++i) {
      if (chance.boolean(likelihood: 40))
        ++trueCount;
      else
        ++falseCount;
    }

    expect(trueCount, lessThan(falseCount));
  });
}
