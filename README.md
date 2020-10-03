# chance

A minimalist generator of random numbers. Inspired by chance.js.

It currently has only basic capabilities. Feel free to contribute.


## Usage

```dart
import 'package:chance/chance.dart';

int randomInteger = Chance.integer(min: 3, max: 12); // 5

double randomDouble = Chance.floating(min: 3, max: 12); // 10.9634128828224

bool randomBool = Chance.boolean(likelihood: 30); // false

```
