# 🌀 Dynamic Extensions

Extensions for nullable types and debug utilities.

## Methods

- `nullOnDebug<T>()` – Returns `null` **only in debug mode**; retains value in release/profile. Useful for testing nullable flows
- `onlyOnDebug<T>()` – Returns the value **only in debug mode**, otherwise `null`
- `maybe<T>({double probability = 0.5})` – Randomly returns `null` based on the given probability (between 0.0 and 1.0). Great for simulating unreliable data in tests or dev mode
- `orDefault(T fallback)` - Returns the fallback value if the provided value is null

## Examples

```dart
// Simulate unreliable data
final value = 'Simulate me'.maybe(probability: 0.3);
// Has a 30% chance of being null

// Provide fallback values
String? name = null;
print(name.orDefault('Anonymous')); // 'Anonymous'
```

## Back to Documentation

[← Back to main documentation](./README.md)
