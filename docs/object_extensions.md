# 🔷 Object Extensions

Generic extensions that work on any object.

## Methods

- `let(transform)` – Executes a function with this object as its argument and returns the result. Useful for chaining operations or transforming values inline
- `also(action)` – Executes a function with this object and returns this object. Useful for performing side effects while maintaining the original value for further chaining

## Examples

```dart
// Transform objects inline
final result = 'hello'.let((it) => it.toUpperCase()); // 'HELLO'
final length = 'test'.let((it) => it.length); // 4

// Execute side effects while chaining
final user = User('John')
  .also((it) => print('Created user: ${it.name}'))
  .also((it) => log.info('User created'));
```

## Back to Documentation

[← Back to main documentation](./README.md)
