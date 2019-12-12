# chance

A minimalist generator of random numbers. Inspired by chance.js.

It currently has only basic capabilities. Feel free to contribute.


## Usage

```
import 'package:chance/chance.dart';

final chance = Chance();

int randomInteger = chance.integer(min: 3, max: 12); // 5

double randomDouble = chance.floating(min: 3, max: 12); // 10.9634128828224

bool randomBool = chance.boolean(likelihood: 30); // false

```
