<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)

# 🧰 Flutter Extension Utils

Extensions that just make sense.

> A handy collection of Dart and Flutter extension methods to supercharge your development experience — clean syntax, reusable logic, and expressive code, all in one lightweight package.

Designed to save you time, reduce boilerplate, and improve readability across widgets, strings, numbers, booleans, and `BuildContext`.


## 🚀 Features

### 🧱 BuildContext Extensions

- `form` – Easily access the nearest `FormState` using `context.form`.

- `navigator` – Shorthand for `Navigator.of(context)`.
- `overlay` – Access the current `OverlayState` from the context.
- `scaffold` – Retrieve the nearest `ScaffoldState` with `context.scaffold`.

#### ScaffoldMessenger

- `scaffoldMessenger` – Quickly get the `ScaffoldMessengerState` for showing snackbars and more.

- `void showSnackBar(String content, {Duration? duration, SnackBarBehavior behavior = SnackBarBehavior.fixed})` - Quickly show a SnackBar without manually accessing ScaffoldMessenger.

#### Media Query
- `mediaQuery` – Access `MediaQueryData` from context.

- `platformBrightness` – Get the system's brightness setting (`Brightness.dark` or `Brightness.light`).
- `platformInDarkMode` – Returns `true` if the app is currently in dark mode.
- `widgetSize` – Get the rendered size of the widget associated with the context.
- `widgetHeight` – Convenience getter for just the height of the widget.
- `widgetWidth` – Convenience getter for just the width.

#### Media Query Orientation
- `orientation` – Access the current screen orientation (`portrait` or `landscape`).

- `isLandscape` / `isPortrait` – Easy checks for current orientation.
- `widgetShortestSide` – Useful for responsive layouts based on the device's shortest screen edge.
- `isPhone` – Returns `true` if the device is considered a phone.
- `isSmallTablet`, `isLargeTablet` – Classify tablets based on width.
- `isTablet` – Shortcut combining both small and large tablets.
- `isDesktop` – Detects larger screens, typically desktops.

-------------------------------------------------------------------------------

### 🗓️ DateTime Extensions

#### ✅ Checkers
- `isAfternoon()` – Checks if the time is between 12:00 PM and 5:59 PM.

- `isMorning()` – Checks if the time is before 12:00 PM.
- `isEvening()` – Checks if the time is between 6:00 PM and 8:59 PM.
- `isNight()` – Checks if the time is after 9:00 PM.
- `isToday()` / `isTomorrow()` / `isYesterday()` – Quickly check the relation to the current day.
- `isSameDay(DateTime other)` – Returns `true` if the date is the same calendar day as `other`.
- `isInPast()` / `isInFuture()` – Check if the datetime is before or after now.
- `isExpired()` – A semantic shortcut for `isInPast()`.
- `isAgeOlder(age)` / `isAgeYounger(age)` / `isAgeEqualTo(age)` – Check against an age.
- `isAgeBetween(min, max)` – Check if the age is within a given range.

#### 🔧 Manipulators
- `addDays(int)` / `addMonths(int)` / `addYears(int)` – Add to the datetime.

- `addHours(int)` / `addMinutes(int)` / `addSeconds(int)` – Add smaller units.
- `subDays(int)` / `subMonths(int)` / `subYears(int)` – Subtract from the datetime.
- `subHours(int)` / `subMinutes(int)` / `subSeconds(int)` – Subtract smaller units.

#### 🧠 Time to String
- `toAge()` – Convert the date to an age in years.

- `toDateString({String format = "yyyy-MM-d"})` – Format as a custom date string.
- `toDateStringUK()` – Format in British style (dd/MM/yyyy).
- `toDateStringUS()` – Format in US style (MM/dd/yyyy).
- `toDateTimeString()` – Full readable datetime string.
- `toFormat(String format)` – Fully custom format using `intl`.
- `toTimeAgoString()` – Human-readable "time ago" format (e.g. "2 days ago").
- `toTimeString()` – Convert to time only (e.g. `14:35` or `14:35:59`).
- `toShortDate()` – Returns a short formatted date string (e.g. `Apr 25, 2025`).
- `toDayOrdinal()` – Get the day of the month with ordinal (e.g. `1st`, `22nd`, `31st`).

-------------------------------------------------------------------------------

### ⏳ Duration Extensions

- `delay([callback])` – Delays execution for the given duration. Optionally accepts a callback to run after the delay.

```dart
// Example
await 2.seconds.delay(() {
  print('Delayed by 2 seconds');
});
```

-------------------------------------------------------------------------------

### 🌀 Dynamic Extensions

- `nullOnDebug<T>()` – Returns `null` **only in debug mode**; retains value in release/profile. Useful for testing nullable flows.

- `onlyOnDebug<T>()` – Returns the value **only in debug mode**, otherwise `null`.
- `maybe<T>({double probability = 0.5})` – Randomly returns `null` based on the given probability (between 0.0 and 1.0). Great for simulating unreliable data in tests or dev mode.

```dart
final value = 'Simulate me'.maybe(probability: 0.3);
// Has a 30% chance of being null
```

-------------------------------------------------------------------------------

### 🖼️ Image Extensions

- `circleAvatar({ ... })` – Quickly convert an `ImageProvider` to a `CircleAvatar` widget with full customisation options.

```dart
// Example
NetworkImage('https://example.com/pic.jpg').circleAvatar(radius: 40);
```

#### Parameters:

- backgroundColor – Background colour of the avatar (default is transparent).
- radius – Sets the circular radius of the avatar.
- minRadius / maxRadius – Optional constraints.
- foregroundColor – Colour for the foreground image.
- onBackgroundImageError / onForegroundImageError – Handle image load failures.

-------------------------------------------------------------------------------

### 🔢 Number Extensions

#### 🧮 General Num Extensions
- `isEqual(otherNum)` – Checks if two numbers are exactly equal.

- `isGreaterThan(otherNum)` – Returns `true` if the number is greater.
- `isLessThan(otherNum)` – Returns `true` if the number is less.
- `clampMin(min)` – Clamps the number to a minimum value.
- `clampMax(max)` – Clamps the number to a maximum value.

#### 🎲 Random Generators
- `randomLess({min = 1.0})` – For `int` or `double`, generates a random value **less than** the current one, starting from the `min`.

- `randomMore(max)` – Generates a random value **greater than** the current one, up to `max`.

```dart
10.randomLess(); // e.g. returns 3, 7, etc.
5.5.randomMore(10.0); // e.g. returns 6.23, etc.
```

#### 💰 Number Formatting
- `formatAsCurrency({locale, symbol, decimalDigits})` – Formats the number as currency.

- `formatAsDecimal({locale, decimalDigits})` – Formats the number as a decimal with specified precision.
- `formatAsNumber({locale})` – Formats as a regular number string.

```dart
1234.5.formatAsCurrency(locale: 'en_NG', symbol: '₦'); // ₦1,234.50
```

#### ⏱️ Number to Duration
- `days`, `hours`, `minutes`, `seconds`, `milliseconds`, `microseconds` – Shorthand for converting numbers to Duration.

```dart
// Example
await 2.seconds.delay(); // Waits for 2 seconds
```

-------------------------------------------------------------------------------

### 🔤 String Extensions

#### ✅ Utilities
- `matchesRegExp(regex)` – Checks if the string matches a given regular expression.
- `toBool` – Converts `"true"` or `"false"` to a boolean.
- `toDateTime()` – Parses the string into a `DateTime` object.
- `toRegExp()` – Converts the string into a `RegExp`.
- `limit(maxLength, [overflow = "…"])` – Limits string length with optional overflow characters.

- `mask({start = 2, end = 2, maskChar = '*', maskLength})` – Masks the middle of the string, leaving edges visible.

```dart
'08012345678'.mask(); // 08*******78
'08012345678'.mask(maskLength: 2); // 08**78
```

#### 🎀 Pretty Printing

- `prettyJson()` – Formats a raw JSON string.

- `prettyXml()` – Formats raw XML into readable indents.
- `prettyYaml()` – Formats YAML strings prettily.

#### 🔠 Casing

- `camelCase` – Converts string to camelCase.

- `capitalised` – Capitalises the first letter of each word.
- `kebabCase` – Converts string to kebab-case.
- `pascalCase` – Converts string to PascalCase.
- `snakeCase` – Converts string to snake_case.
- `titleCase` – Converts string to Title Case.

```dart
'the big brown fox'.camelCase; // theBigBrownFox
'the big brown fox'.capitalised; // The big brown fox
'the big brown fox'.pascalCase; // TheBigBrownFox
'the big brown fox'.kebabCase; // the-big-brown-fox
'the big brown fox'.snakeCase; // the_-_big_-_brown_-_fox
'the big brown fox'.titleCase; // The Big Brown Fox
```

#### 🧪 Case and Pattern Checkers

##### Case Checkers

- `isCamelCase`

- `isPascalCase`
- `isSnakeCase`
- `isKebabCase`
- `isTitleCase`
- `isCapitalised`
- `isUpperCase`
- `isLowerCase`

##### Pattern Checkers

- `isEmail`

- `isURL`
- `isUlid`
- `isUuid`
- `isSlug`
- `isHexColor`
- `isIPAddress`
- `isNum – Validates numeric string`
- `isAlphabetOnly`
- `isNumericOnly`


-------------------------------------------------------------------------------

### 🧩 Widget Extensions

#### 🪄 Basic Transformations

- `center({heightFactor, widthFactor})` – Wraps widget in a `Center`.

- `expanded([flex = 1])` – Wraps widget in an `Expanded`.
- `flexible({flex = 1, fit = FlexFit.loose})` – Wraps widget in a `Flexible`.
- `opacity(opacity)` – Wraps widget with an `Opacity` widget.
- `sizedBox({width, height})` – Wraps widget with a `SizedBox`.
- `constrained({maxHeight, maxWidth, minHeight, minWidth})` – Wraps widget with a `ConstrainedBox`.

---

#### ✂️ Clipping
- `clipRect()` – Clips widget to a rectangle.

- `clipRRect(borderRadius)` – Clips widget with rounded corners.
- `clipRounded([radius = 12])` – Quickly clip widget with a uniform rounded border.

---

#### 🧹 Padding
- `paddingAll(padding)` – Adds equal padding on all sides.

- `paddingSymmetric({horizontal, vertical})` – Adds symmetric horizontal and vertical padding.
- `paddingOnly({left, top, right, bottom})` – Custom padding for specific sides.
- `paddingZero()` – Adds zero padding.

---

#### 🧭 Positioning
- `positionAlign(alignment)` – Aligns widget using `Align`.

- `positionedFill()` – Fills parent constraints using `Positioned.fill`.

---

#### 👻 Visibility Helpers
- `hideIf(condition)` – Hides widget (returns `SizedBox.shrink()`) if `condition` is true.

- `hideUnless(condition)` – Hides widget unless `condition` is true.
- `showIf(condition)` – Shows widget if `condition` is true, otherwise hides.
- `showUnless(condition)` – Shows widget unless `condition` is true.

---

#### 🔘 inkwellManager on Widget
A helper class for managing taps on a widget in a cleaner way.

- `inkWellManager(callback, {color = Colors.transparent})` – Wraps widget with an `InkWell` for tap detection.

- `onTap()` – Wraps child with `InkWell` for tap gesture.
- `onDoubleTap()` – Wraps child with `InkWell` for double-tap gesture.
- `onLongPress()` – Wraps child with `InkWell` for long-press gesture.

> **Tip:** Used alongside the `inkWellManager` extension to easily attach tap interactions without boilerplate.

```dart
Text('Click Me')
  .inkWellManager(() => print('Tapped'), color: Colors.black)
  .onTap();
```

##### 💡 Why InkWellManager?

Normally, to make a widget respond to taps, you must manually wrap it inside an InkWell every time, setting colours and callbacks.
InkWellManager simplifies this by providing quick `.onTap()`, `.onDoubleTap()`, and `.onLongPress()` methods — making your code shorter, cleaner, and more maintainable.

It also auto-applies the same splash, hover, and focus colours without extra setup.

## Usage

To use, simply import the package into your project and you can then all of the extensions it provdes 🫶🏾

```dart
import 'package:flutter_utils_extensions/flutter_utils_extensions.dart';

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
