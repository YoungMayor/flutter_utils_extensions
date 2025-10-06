part of './../extensions.dart';

extension MayrObjectExtensions on Object {
  /// Executes a function with this object as its argument and returns the result.
  ///
  /// This is useful for chaining operations or transforming values inline.
  ///
  /// Example:
  /// ```dart
  /// final result = 'hello'.let((it) => it.toUpperCase()); // 'HELLO'
  /// final length = 'test'.let((it) => it.length); // 4
  /// ```
  R let<R>(R Function(Object it) transform) => transform(this);

  /// Executes a function with this object and returns this object.
  ///
  /// This is useful for performing side effects while maintaining
  /// the original value for further chaining.
  ///
  /// Example:
  /// ```dart
  /// final user = User('John')
  ///   .also((it) => print('Created user: ${it.name}'))
  ///   .also((it) => log.info('User created'));
  /// ```
  T also<T extends Object>(void Function(T it) action) {
    action(this as T);
    return this as T;
  }
}
