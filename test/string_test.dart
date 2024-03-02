import 'package:test/test.dart';
import 'package:chance/chance.dart';

void main() {
  test('returns random values', () {
    for (var i = 0; i < 1000; ++i)
      expect(randomString(1000), isNot(randomString(1000)));
  });

  test('returns proper length', () {
    for (var i = 0; i < 1000; ++i) {
      final length = randomInt(0, 1000);
      expect(randomString(length), hasLength(length));
    }
  });

  test('secure works', () {
    final a = randomString(32, secure: true);
    final b = randomString(32, secure: true);
    expect(a, allOf(hasLength(32), isNot(b)));
  });

  test('utilizes custom pools', () {
    expect(randomString(1, pool: 'a'), equals('a'));
    expect(randomString(10000, pool: 'abc'), allOf(
        contains('a'),
        contains('b'),
        contains('c'),
        isNot(contains('d'))));
  });
}
