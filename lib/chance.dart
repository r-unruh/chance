import 'dart:math';

final _random = Random();

/// Returns a random integer from min to max, inclusive.
int randomInt(int min, int max) {
  if (min > max) {
    throw RangeError('max must be greater than min');
  }
  return (_random.nextDouble() * (max - min + 1) + min).floor();
}

/// Returns a random floating point number from min to max.
double randomDouble(double min, double max) {
  if (min > max) {
    throw RangeError('max must be greater than min');
  }
  return _random.nextDouble() * (max - min) + min;
}

/// Returns a random boolean value (true or false).
///
/// You may define an optional [likelihood] from 0 to 1.
bool randomBool([double? likelihood]) {
  if (likelihood == null) {
    return _random.nextBool();
  }

  if (likelihood > 1 || likelihood < 0) {
    throw RangeError('likelihood must be within range of 0 and 1');
  }

  return _random.nextDouble() < likelihood;
}

/// Returns a random String with a set length.
///
/// Is cryptographically insecure by default. Set [secure] to true to utilize
/// [Random.secure]. You may provide a [pool] of characters to pick from.
String randomString(int length,
    {bool secure = false,
    String pool =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'}) {
  final random = secure ? Random.secure() : _random;
  return List.generate(length, (i) => pool[random.nextInt(pool.length)]).join();
}

/// Picks a random item from a non-empty Iterable.
T randomItem<T>(Iterable<T> pool) {
  if (pool.isEmpty) {
    throw ArgumentError(
        'Pool must not be empty. Consider using randomItemOrNull instead.');
  }
  return pool.elementAt(_random.nextInt(pool.length));
}

/// Picks a random item from an Iterable or null if it's empty.
T? randomItemOrNull<T>(Iterable<T> pool) =>
    pool.isEmpty ? null : pool.elementAtOrNull(_random.nextInt(pool.length));
