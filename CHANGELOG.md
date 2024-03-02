## 3.1.0
* Add randomString function

## 3.0.1
* Add migration guide

## 3.0.0
### BREAKING
This is basically a complete rewrite and not compatible to the old interface at
all.

### Changes
* Simplify everything
  * Replace ambiguously optional min/max named parameters with required
    positional ones
  * Drop minMax parameter
* Add new functions
  * randomItem
  * randomItemOrNull
* Update sdk constraints

### Migration
```dart
Chance.integer(min: 3, max: 5)  --> randomInt(3, 5)
Chance.integer(minMax: 3)       --> randomInt(-3, 3)
Chance.floating(min: 3, max: 5) --> randomDouble(3, 5)
Chance.floating(minMax: 3)      --> randomDouble(-3, 3)
Chance.boolean(likelihood: 60)  --> randomBool(.6)
```

## 2.1.0
* Add null safety

## 2.0.0
* Breaking: Chance class is now static and no longer needs to be instantiated
* Add example

## 1.0.0+1
* Fix more hints

## 1.0.0
* Fix hints
* Update meta data

## 0.9.1
* Update author information

## 0.9.0
* Move repository from Github to Gitlab
* Minor refactoring

## 0.1.4
* Add `minMax` parameter to `integer` and `floating` methods:
  So instead of
  `integer(min: -value, max: value);`
  you may now write
  `integer(minMax: value);`
  or
  `integer(minMax: -value);`
* Minor refactoring

## 0.1.3
* Fix typo in exception message
* Minor refactoring

## 0.1.2
* Add boolean method

## 0.1.1
* Add some documentation
* Add exceptions if `min` argument is provided without `max`

## 0.1.0
Initial version
