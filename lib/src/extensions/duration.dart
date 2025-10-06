part of './../extensions.dart';

extension MayrDurationExtensions on Duration {
  /// Delays execution for the duration of this [Duration].
  ///
  /// Optionally executes [callback] after the delay.
  ///
  /// Example:
  /// ```dart
  /// await 2.seconds.delay(); // Waits for 2 seconds
  /// await 2.seconds.delay(() => print('Done!')); // Waits 2 seconds, then prints
  /// ```
  Future delay([FutureOr Function()? callback]) async =>
      Future.delayed(this, callback);

  /// Returns a human-readable string representation of the duration.
  ///
  /// Example:
  /// ```dart
  /// Duration(hours: 2, minutes: 30).toReadableString(); // '2h 30m'
  /// Duration(days: 1, hours: 5).toReadableString(); // '1d 5h'
  /// ```
  String toReadableString() {
    final days = inDays;
    final hours = inHours.remainder(24);
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    final parts = <String>[];
    if (days > 0) parts.add('${days}d');
    if (hours > 0) parts.add('${hours}h');
    if (minutes > 0) parts.add('${minutes}m');
    if (seconds > 0 || parts.isEmpty) parts.add('${seconds}s');

    return parts.join(' ');
  }

  /// Checks if this duration is longer than [other].
  ///
  /// Example:
  /// ```dart
  /// 5.seconds.isLongerThan(3.seconds); // true
  /// ```
  bool isLongerThan(Duration other) => this > other;

  /// Checks if this duration is shorter than [other].
  ///
  /// Example:
  /// ```dart
  /// 3.seconds.isShorterThan(5.seconds); // true
  /// ```
  bool isShorterThan(Duration other) => this < other;
}
