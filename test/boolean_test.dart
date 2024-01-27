import 'package:test/test.dart';
import 'package:chance/chance.dart';

void main() {
  test('works without argument', () {
    var trueCount = 0;

    for (var i = 0; i < 100000; ++i)
      if (randomBool())
        ++trueCount;

    expect(trueCount, inInclusiveRange(40000, 60000));
  });

  test('likeliness > 50%', () {
    var trueCount = 0;

    for (var i = 0; i < 100000; ++i)
      if (randomBool(.6))
        ++trueCount;

    expect(trueCount, greaterThan(50000));
  });

  test('likeliness < 50%', () {
    var trueCount = 0;

    for (var i = 0; i < 100000; ++i)
      if (randomBool(.4))
        ++trueCount;

    expect(trueCount, lessThan(50000));
  });
}
