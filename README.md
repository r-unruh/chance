# chance

## A minimalist set of functions to generate random numbers, strings etc.
Provides common convenience methods for getting some randomness.

This was initially inspired by the great JavaScript library chance.js but then
took a more frugal approach. Instead of stuffing it with all kinds of heavy
functions it provides you with just the basics that allow you to build upon.

## Usage
```dart
import 'package:chance/chance.dart';

int foo = randomInt(3, 12); // 6

double bar = randomDouble(10, 20); // 10.9634128828224

bool lorem = randomBool(.2); // false

String ipsum = randomString(8); // 'Hxmde8XA'

String dolor = randomItem(['cat', 'dog', 'tiger']); // 'cat'

dynamic sit = randomItemOrNull([]); // null
```

That's it, that's the whole API. Enjoy!
