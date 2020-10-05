import 'package:chance/chance.dart';

void main() {
  int randomInteger = Chance.integer(min: 3, max: 12);

  double randomDouble = Chance.floating(min: 3, max: 12);

  bool randomBool = Chance.boolean(likelihood: 30);

  print('Random integer: $randomInteger\n'
      'Random double: $randomDouble\n'
      'Random boolean: $randomBool');
}
