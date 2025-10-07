# ✅ Bool Extensions

Utilities for working with boolean values.

## Methods

- `choose(trueValue, falseValue)` – Returns `trueValue` if the boolean is true, otherwise returns `falseValue`
- `toInt()` – Converts the boolean to an integer (1 for true, 0 for false)
- `toYesNo({trueString, falseString})` – Converts to a string representation with customizable values
- `not` – Returns the negation of the boolean (equivalent to `!this`)

## Examples

```dart
// Choose between values
true.choose('Active', 'Inactive'); // 'Active'
false.choose('Active', 'Inactive'); // 'Inactive'

// Convert to integer
true.toInt(); // 1
false.toInt(); // 0

// Convert to Yes/No strings
true.toYesNo(); // 'Yes'
false.toYesNo(trueString: 'On', falseString: 'Off'); // 'Off'

// Negation
true.not; // false
```

## Back to Documentation

[← Back to main documentation](./README.md)
