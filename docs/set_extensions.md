# 🔢 Set Extensions

Extensions for working with `Set` objects.

## Methods

- `toggle(element)` → Adds if missing, removes if present
- `intersects(otherSet)` → Check for intersection
- `isSubsetOf(otherSet)` → Check if subset
- `isSupersetOf(otherSet)` → Check if superset
- `unionAll(sets)` → Union of multiple sets
- `without(element)` → Remove element

## Examples

```dart
// Toggle elements
{1, 2, 3}.toggle(2); // {1, 3}
{1, 2, 3}.toggle(4); // {1, 2, 3, 4}

// Check relationships
{1, 2, 3}.intersects({2, 3, 4}); // true
{1, 2}.isSubsetOf({1, 2, 3}); // true

// Union operations
{1, 2}.unionAll([{2, 3}, {3, 4}]); // {1, 2, 3, 4}
```

## Back to Documentation

[← Back to main documentation](./README.md)
