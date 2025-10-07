part of './../extensions.dart';

extension MayrDurationHumanizeExtensions on Duration {
  /// Converts the duration to a human-readable string.
  ///
  /// Example:
  /// ```dart
  /// Duration(hours: 2, minutes: 3).humanize(); // '2 hours, 3 minutes'
  /// Duration(days: 1).humanize(); // '1 day'
  /// Duration(seconds: 45).humanize(); // '45 seconds'
  /// ```
  String humanize({String locale = 'en'}) {
    final days = inDays;
    final hours = inHours.remainder(24);
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    final parts = <String>[];

    if (days > 0) {
      parts.add('$days ${days == 1 ? 'day' : 'days'}');
    }
    if (hours > 0) {
      parts.add('$hours ${hours == 1 ? 'hour' : 'hours'}');
    }
    if (minutes > 0) {
      parts.add('$minutes ${minutes == 1 ? 'minute' : 'minutes'}');
    }
    if (seconds > 0 && days == 0 && hours == 0) {
      parts.add('$seconds ${seconds == 1 ? 'second' : 'seconds'}');
    }

    if (parts.isEmpty) return '0 seconds';
    if (parts.length == 1) return parts[0];
    if (parts.length == 2) return '${parts[0]}, ${parts[1]}';

    return '${parts.sublist(0, parts.length - 1).join(', ')}, and ${parts.last}';
  }
}

extension MayrDateTimeHumanizeExtensions on DateTime {
  /// Converts the date time to a human-readable relative time string.
  ///
  /// Example:
  /// ```dart
  /// DateTime.now().humanize(); // 'just now'
  /// DateTime.now().subtract(Duration(hours: 3)).humanize(); // '3 hours ago'
  /// DateTime.now().add(Duration(days: 2)).humanize(); // '2 days from now'
  /// ```
  String humanize({String locale = 'en'}) {
    final now = DateTime.now();
    final difference = now.difference(this);
    final isFuture = difference.isNegative;
    final absDifference = difference.abs();

    if (absDifference.inSeconds < 30) {
      return 'just now';
    }

    if (absDifference.inMinutes < 1) {
      return isFuture ? 'in a few seconds' : 'a few seconds ago';
    }

    if (absDifference.inMinutes < 60) {
      final minutes = absDifference.inMinutes;
      if (minutes == 1) {
        return isFuture ? 'in 1 minute' : '1 minute ago';
      }
      return isFuture ? 'in $minutes minutes' : '$minutes minutes ago';
    }

    if (absDifference.inHours < 24) {
      final hours = absDifference.inHours;
      if (hours == 1) {
        return isFuture ? 'in 1 hour' : '1 hour ago';
      }
      return isFuture ? 'in $hours hours' : '$hours hours ago';
    }

    if (absDifference.inDays == 1) {
      return isFuture ? 'tomorrow' : 'yesterday';
    }

    if (absDifference.inDays < 7) {
      final days = absDifference.inDays;
      return isFuture ? 'in $days days' : '$days days ago';
    }

    if (absDifference.inDays < 14) {
      return isFuture ? 'next week' : 'last week';
    }

    if (absDifference.inDays < 30) {
      final weeks = (absDifference.inDays / 7).floor();
      return isFuture ? 'in $weeks weeks' : '$weeks weeks ago';
    }

    if (absDifference.inDays < 60) {
      return isFuture ? 'next month' : 'last month';
    }

    if (absDifference.inDays < 365) {
      final months = (absDifference.inDays / 30).floor();
      return isFuture ? 'in $months months' : '$months months ago';
    }

    final years = (absDifference.inDays / 365).floor();
    if (years == 1) {
      return isFuture ? 'next year' : 'last year';
    }
    return isFuture ? 'in $years years' : '$years years ago';
  }
}

extension MayrNumHumanizeExtensions on num {
  /// Converts the number to a human-readable compact format.
  ///
  /// Example:
  /// ```dart
  /// 1234.humanizeNumber(); // '1.2k'
  /// 1500000.humanizeNumber(); // '1.5M'
  /// 999.humanizeNumber(); // '999'
  /// ```
  String humanizeNumber({int decimals = 1}) {
    if (abs() < 1000) return toString();

    final suffixes = ['', 'k', 'M', 'B', 'T'];
    var index = 0;
    var value = toDouble();

    while (value.abs() >= 1000 && index < suffixes.length - 1) {
      value /= 1000;
      index++;
    }

    if (value == value.roundToDouble()) {
      return '${value.toInt()}${suffixes[index]}';
    }

    return '${value.toStringAsFixed(decimals)}${suffixes[index]}';
  }

  /// Converts the number to an ordinal string (1st, 2nd, 3rd, etc.).
  ///
  /// Example:
  /// ```dart
  /// 1.humanizeOrdinal(); // '1st'
  /// 2.humanizeOrdinal(); // '2nd'
  /// 3.humanizeOrdinal(); // '3rd'
  /// 21.humanizeOrdinal(); // '21st'
  /// ```
  String humanizeOrdinal() {
    final n = toInt();
    if (n % 100 >= 11 && n % 100 <= 13) {
      return '${n}th';
    }

    switch (n % 10) {
      case 1:
        return '${n}st';
      case 2:
        return '${n}nd';
      case 3:
        return '${n}rd';
      default:
        return '${n}th';
    }
  }

  /// Converts the number to a count with singular/plural item name.
  ///
  /// Example:
  /// ```dart
  /// 1.humanizeCount('item'); // '1 item'
  /// 3.humanizeCount('item'); // '3 items'
  /// 0.humanizeCount('item'); // '0 items'
  /// ```
  String humanizeCount(String itemName, {String? pluralName}) {
    final count = toInt();
    final name = count == 1 ? itemName : (pluralName ?? '${itemName}s');
    return '$count $name';
  }

  /// Converts the number to a percentage string.
  ///
  /// Example:
  /// ```dart
  /// 0.75.humanizePercentage(); // '75%'
  /// 50.humanizePercentage(max: 100); // '50%'
  /// ```
  String humanizePercentage({num max = 1, int decimals = 0}) {
    final percentage = (this / max * 100);
    if (decimals == 0) {
      return '${percentage.round()}%';
    }
    return '${percentage.toStringAsFixed(decimals)}%';
  }

  /// Converts bytes to a human-readable file size.
  ///
  /// Example:
  /// ```dart
  /// 1024.humanizeFileSize(); // '1.0 KB'
  /// 1048576.humanizeFileSize(); // '1.0 MB'
  /// 520300.humanizeFileSize(); // '508.1 KB'
  /// ```
  String humanizeFileSize({int decimals = 1}) {
    if (this < 0) return 'Invalid size';
    if (this == 0) return '0 B';

    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    var index = 0;
    var size = toDouble();

    while (size >= 1024 && index < suffixes.length - 1) {
      size /= 1024;
      index++;
    }

    if (index == 0 || size == size.roundToDouble()) {
      return '${size.toInt()} ${suffixes[index]}';
    }

    return '${size.toStringAsFixed(decimals)} ${suffixes[index]}';
  }
}
