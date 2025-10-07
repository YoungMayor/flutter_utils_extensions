# ⏳ Duration Extensions

Extensions for working with `Duration` objects.

## Methods

- `delay([callback])` – Delays execution for the given duration. Optionally accepts a callback to run after the delay
- `toReadableString()` – Returns a human-readable string representation (e.g., '2h 30m', '1d 5h 30m')
- `isLongerThan(other)` – Checks if this duration is longer than another duration
- `isShorterThan(other)` – Checks if this duration is shorter than another duration

## Examples

```dart
// Delay execution
await 2.seconds.delay(() {
  print('Delayed by 2 seconds');
});

// Human-readable string
final duration = Duration(hours: 2, minutes: 30);
print(duration.toReadableString()); // '2h 30m'

// Compare durations
5.seconds.isLongerThan(3.seconds); // true
3.seconds.isShorterThan(5.seconds); // true
```

## Back to Documentation

[← Back to main documentation](./README.md)
