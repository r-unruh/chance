import 'package:chance/chance.dart';

int foo = randomInt(3, 12); // 6

double bar = randomDouble(3, 12); // 10.9634128828224

bool lorem = randomBool(.2); // false

String ipsum = randomItem(['cat', 'dog', 'tiger']); // 'cat'

String? dolor = randomItemOrNull([]); // null
