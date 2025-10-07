# 🎯 Humanize Extensions

Convert technical or numeric values into readable, natural, human-friendly strings.

> Where computers speak in seconds, bytes, and counts, `humanize` translates them into something that sounds like it came from a person.

## Durations

- `.humanize(locale)` → "2 hours, 3 minutes"

### Examples

```dart
Duration(hours: 2, minutes: 3).humanize(); // '2 hours, 3 minutes'
Duration(days: 1).humanize(); // '1 day'
Duration(seconds: 45).humanize(); // '45 seconds'
```

## Time (DateTime)

- `.humanize(locale)` → "just now", "3 hours ago", "yesterday", "last week", "3 days from now", "2 weeks ago"

### Examples

```dart
DateTime.now().humanize(); // 'just now'
DateTime.now().subtract(Duration(hours: 3)).humanize(); // '3 hours ago'
DateTime.now().subtract(Duration(days: 1)).humanize(); // 'yesterday'
DateTime.now().add(Duration(days: 2)).humanize(); // 'in 2 days'
```

## Numbers

- `humanizeNumber()` → "15.3k", "1.5M"
- `humanizeOrdinal()` → "1st", "2nd", "3rd"
- `humanizeCount('item')` → "1 item" / "3 items"
- `humanizePercentage(max, min)` → "74%"
- `humanizeFileSize()` → "1.0 MB", "520.3 KB"

### Examples

```dart
1234.humanizeNumber(); // '1.2k'
1500000.humanizeNumber(); // '1.5M'
1.humanizeOrdinal(); // '1st'
21.humanizeOrdinal(); // '21st'
3.humanizeCount('item'); // '3 items'
0.75.humanizePercentage(); // '75%'
1024.humanizeFileSize(); // '1.0 KB'
520300.humanizeFileSize(); // '508.1 KB'
```

## Back to Documentation

[← Back to main documentation](./README.md)
