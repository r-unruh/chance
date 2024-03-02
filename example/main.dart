import 'package:chance/chance.dart';

String randomName() {
  var name = '';

  for (var i = 0; i < randomInt(2, 4); i++) {
    final consonant = randomString(1, pool: 'bcdfghjklmnpqrstvwxz');
    final vowel = randomString(1, pool: 'aeiou');
    name += consonant + vowel;
  }

  return name;
}

String randomDomain() {
  final name = randomName();
  final tld = randomItem(['com', 'net', 'org', 'me']);
  return '$name.$tld';
}

void main() {
  final name = randomName();
  final email = '$name@${randomDomain()}';
  final password = randomString(12, secure: true);

  print(name);
  print(email);
  print(password);
}
