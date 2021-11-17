import 'dart:math';

/// The main class that provides all the functions.
///
/// Example:
/// ```
/// int number = Chance.integer(min: 10, max: 20);
/// ```
class Chance {
  // Maximum integer that JS supports.
  static const _maxInt = 9007199254740992;
  static const _minInt = -_maxInt;
  static final Random _random = Random();

  /// Returns a random integer.
  ///
  /// Leave out [min] to get a value between 0 and [max].
  /// Leave out all arguments to get a value between [_minInt] and [_maxInt].
  /// Provide (only) [minMax] to get a random value between -[minMax] and +[minMax].
  /// It can be either positive or negative.
  static int integer({int? min, int? max, int? minMax}) {
    _checkArguments(min: min, max: max, minMax: minMax);

    if (min == null && max == null && minMax == null) {
      return integer(min: _minInt, max: _maxInt);
    }

    if (min == null && max != null) {
      min = 0;
    } else if (minMax != null) {
      min = -minMax.abs();
      max = minMax.abs();
    }

    return (_randomDouble * (max! - min! + 1) + min).floor();
  }

  /// Returns a random floating / double number.
  ///
  /// Leave out [min] to get a value between 0 and [max].
  /// Leave out all arguments to get a value between 0 and 1.
  /// Provide (only) [minMax] to get a random value between -[minMax] and +[minMax].
  /// It can be either positive or negative.
  static double floating({double? min, double? max, double? minMax}) {
    _checkArguments(min: min, max: max, minMax: minMax);

    if (min == null && max == null && minMax == null) {
      return _randomDouble;
    }

    if (min == null && max != null) {
      min = 0.0;
    } else if (minMax != null) {
      min = -minMax.abs();
      max = minMax.abs();
    }

    return _randomDouble * (max! - min!) + min;
  }

  /// Returns a random boolean value (true or false).
  ///
  /// The default likelihood of success (returning true) is 50%.
  /// Set an optional [likelihood] from 0 to 100.
  static bool boolean({double? likelihood}) {
    if (likelihood == null) {
      return _random.nextBool();
    }

    if (likelihood > 100 || likelihood < 0) {
      throw RangeError('likelihood accepts values from 0 to 100.');
    }

    return _randomDouble * 100 < likelihood;
  }

  static void _checkArguments({num? min, num? max, num? minMax}) {
    if (minMax != null && (min != null || max != null)) {
      throw ArgumentError(
          'minMax must not be provided along with other values.');
    }

    if (min != null && max == null) {
      throw ArgumentError('Must not provide min without max.');
    }

    if (min != null && max != null && min > max) {
      throw RangeError('min must not be greater than max.');
    }
  }

  static double get _randomDouble => _random.nextDouble();
}
