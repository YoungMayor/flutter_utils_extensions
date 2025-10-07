![License](https://img.shields.io/badge/license-MIT-blue.svg?label=Licence)
![Platform](https://img.shields.io/badge/Platform-Flutter-blue.svg)

![Pub Version](https://img.shields.io/pub/v/mayr_extensions?style=plastic&label=Version)
![Pub.dev Score](https://img.shields.io/pub/points/mayr_extensions?label=Score&style=plastic)
![Pub Likes](https://img.shields.io/pub/likes/mayr_extensions?label=Likes&style=plastic)
![Pub.dev Publisher](https://img.shields.io/pub/publisher/mayr_extensions?label=Publisher&style=plastic)
![Downloads](https://img.shields.io/pub/dm/mayr_extensions.svg?label=Downloads&style=plastic)

![Build Status](https://img.shields.io/github/actions/workflow/status/YoungMayor/flutter_utils_extensions/ci.yaml?label=Build)
![Issues](https://img.shields.io/github/issues/YoungMayor/flutter_utils_extensions.svg?label=Issues)
![Last Commit](https://img.shields.io/github/last-commit/YoungMayor/flutter_utils_extensions.svg?label=Latest%20Commit)
![Contributors](https://img.shields.io/github/contributors/YoungMayor/flutter_utils_extensions.svg?label=Contributors)


# 🧰 Flutter Extension Utils

Extensions that just make sense.

> A handy collection of Dart and Flutter extension methods to supercharge your development experience — clean syntax, reusable logic, and expressive code, all in one lightweight package.

Designed to save you time, reduce boilerplate, and improve readability across widgets, strings, numbers, booleans, and `BuildContext`.

## 🔌 Installation & Setup

The package can be installed using the command
```bash
flutter pub add mayr_extensions
```

And can then be imported using
```dart
import 'package:mayr_extensions/mayr_extensions.dart';
```

## 🚀 Features

This package provides a comprehensive set of extension methods for Flutter and Dart development:

### 📦 Available Extensions

- **[🧱 BuildContext Extensions](docs/build_context_extensions.md)** - Easy access to form, navigator, scaffold, media query, and device type checks
- **[✅ Bool Extensions](docs/bool_extensions.md)** - Boolean utilities including `choose()`, `toInt()`, `toYesNo()`
- **[🗓️ DateTime Extensions](docs/datetime_extensions.md)** - Date manipulation, time checks, age calculations, and formatting
- **[⏳ Duration Extensions](docs/duration_extensions.md)** - Delay execution, readable strings, and duration comparisons
- **[🔷 Object Extensions](docs/object_extensions.md)** - Kotlin-inspired `let()` and `also()` for elegant chaining
- **[🌀 Dynamic Extensions](docs/dynamic_extensions.md)** - Nullable utilities and debug helpers
- **[🖼️ Image Extensions](docs/image_extensions.md)** - Quick `CircleAvatar` creation from `ImageProvider`
- **[🔢 Number Extensions](docs/number_extensions.md)** - Numeric utilities, formatting, random generators, and duration conversions
- **[🔤 String Extensions](docs/string_extensions.md)** - String manipulation, casing, pattern matching, and pretty printing
- **[🧩 Iterable/List Extensions](docs/list_extensions.md)** - Safe access, transformations, aggregations, and query operations
- **[🗺️ Map Extensions](docs/map_extensions.md)** - Map transformations, merging, and filtering
- **[🔢 Set Extensions](docs/set_extensions.md)** - Set operations like toggle, intersects, subset checks
- **[🎯 Humanize Extensions](docs/humanize_extensions.md)** - Convert values to human-readable strings
- **[🧩 Widget Extensions](docs/widget_extensions.md)** - Widget transformations for padding, positioning, clipping, and tap handling
- **[📜 DateTimeFormat](docs/datetime_format.md)** - Pre-defined date/time format strings

### ✨ Quick Examples

```dart
// Duration helpers
await 2.seconds.delay(() => print('Done!'));

// String utilities
'hello world'.camelCase; // helloWorld
'user@example.com'.isEmail; // true

// List operations
[1, 2, 3].firstOrNull(); // 1
[1, null, 2].whereNotNull(); // [1, 2]

// Number formatting
1234.5.formatAsCurrency(locale: 'en_US', symbol: '\$'); // \$1,234.50

// Widget helpers
Text('Hello').paddingAll(16).center();

// Boolean utilities
true.choose('Yes', 'No'); // 'Yes'
```

For detailed documentation on each extension type, click the links above or visit the [docs](docs/) directory.

## Usage

To use, simply import the package into your project and you can then all of the extensions it provdes 🫶🏾

```dart
import 'package:mayr_extensions/mayr_extensions.dart';

```

## 📢 Additional Information

### 🤝 Contributing
Contributions are highly welcome!
If you have ideas for new extensions, improvements, or fixes, feel free to fork the repository and submit a pull request.

Please make sure to:
- Follow the existing coding style.
- Write tests for new features.
- Update documentation if necessary.

> Let's build something amazing together!

---

### 🐛 Reporting Issues
If you encounter a bug, unexpected behaviour, or have feature requests:
- Open an issue on the repository.
- Provide a clear description and steps to reproduce (if it's a bug).
- Suggest improvements if you have any ideas.

Your feedback helps make the package better for everyone!

---

### 📜 Licence
This package is licensed under the MIT License — which means you are free to use it for commercial and non-commercial projects, with proper attribution.

See the [LICENSE](LICENSE) file for more details.

---

## 🌟 Support

If you find this package helpful, please consider giving it a ⭐️ on GitHub — it motivates and helps the project grow!

You can also support by:
- Sharing the package with your friends, colleagues, and tech communities.
- Using it in your projects and giving feedback.
- Contributing new ideas, features, or improvements.

Every little bit of support counts! 🚀💙
