# 🔢 Number Extensions

Comprehensive extensions for numeric types (`num`, `int`, `double`).

## 🧮 General Num Extensions

- `isEqual(otherNum)` – Checks if two numbers are exactly equal
- `isGreaterThan(otherNum)` – Returns `true` if the number is greater
- `isLessThan(otherNum)` – Returns `true` if the number is less
- `clampMin(min)` – Clamps the number to a minimum value
- `clampMax(max)` – Clamps the number to a maximum value
- `isBetween(min, max)` – Checks if the number is within a range (inclusive)
- `isPositive` – Returns `true` if the number is greater than zero
- `isNegativeNumber` – Returns `true` if the number is less than zero
- `isZero` – Returns `true` if the number equals zero

## 🔢 Integer Extensions

- `isEvenNumber` – Checks if the integer is even
- `isOddNumber` – Checks if the integer is odd
- `times(action)` – Repeats an action n times
- `timesIndexed(action)` – Repeats an action n times with the current index

### Examples

```dart
5.isBetween(1, 10); // true
3.times(() => print('Hello')); // Prints 'Hello' 3 times
3.timesIndexed((i) => print('Index: $i')); // Prints indices 0, 1, 2
```

## 🎲 Random Generators

- `randomLess({min = 1.0})` – For `int` or `double`, generates a random value **less than** the current one, starting from the `min`
- `randomMore(max)` – Generates a random value **greater than** the current one, up to `max`

### Examples

```dart
10.randomLess(); // e.g. returns 3, 7, etc.
5.5.randomMore(10.0); // e.g. returns 6.23, etc.
```

## 🎯 Double Extensions

- `toDecimalPlaces(places)` – Rounds the double to a specified number of decimal places

### Examples

```dart
3.14159.toDecimalPlaces(2); // 3.14
3.14159.toDecimalPlaces(4); // 3.1416
```

## 💰 Number Formatting

- `formatAsCurrency({locale, symbol, decimalDigits})` – Formats the number as currency
- `formatAsDecimal({locale, decimalDigits})` – Formats the number as a decimal with specified precision
- `formatAsNumber({locale})` – Formats as a regular number string

### Examples

```dart
1234.5.formatAsCurrency(locale: 'en_NG', symbol: '₦'); // ₦1,234.50
```

## ⏱️ Number to Duration

Shorthand for converting numbers to `Duration`:

- `days`
- `hours`
- `minutes`
- `seconds`
- `milliseconds`
- `microseconds`

### Examples

```dart
// Create durations easily
await 2.seconds.delay(); // Waits for 2 seconds
final timeout = 5.minutes;
final period = 30.days;
```

## Back to Documentation

[← Back to main documentation](./README.md)
