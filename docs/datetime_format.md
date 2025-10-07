# 📜 DateTimeFormat

Pre-defined date and time format strings for common use cases.

This package includes some common date time formats that you can use with the `format()` extension method on `DateTime` objects.

## Available Formats

- `MayrDateTimeFormats.ukDate` - **dd/MM/yyyy** (e.g., 15/01/2025)
- `MayrDateTimeFormats.ukDateTime` - **dd/MM/yyyy HH:mm:ss** (e.g., 15/01/2025 14:30:45)
- `MayrDateTimeFormats.usDate` - **yyyy-MM-dd** (e.g., 2025-01-15)
- `MayrDateTimeFormats.usDateTime` - **yyyy-MM-dd HH:mm:ss** (e.g., 2025-01-15 14:30:45)
- `MayrDateTimeFormats.time` - **HH:mm:ss** (e.g., 14:30:45)
- `MayrDateTimeFormats.timeNoSecs` - **HH:mm** (e.g., 14:30)

## Usage

```dart
import 'package:mayr_extensions/mayr_extensions.dart';

final now = DateTime.now();

// Use pre-defined formats
print(now.format(MayrDateTimeFormats.ukDate)); // 15/01/2025
print(now.format(MayrDateTimeFormats.usDateTime)); // 2025-01-15 14:30:45
print(now.format(MayrDateTimeFormats.time)); // 14:30:45

// Or use custom formats
print(now.format('EEEE, MMMM d, yyyy')); // Wednesday, January 15, 2025
```

## Back to Documentation

[← Back to main documentation](./README.md)
