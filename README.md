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
- `platformInDarkMode` | `platformInLightMode` – Returns `true` based on the app's current brightness mode.
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

### ✅ Bool Extensions

- `choose(trueValue, falseValue)` – Returns `trueValue` if the boolean is true, otherwise returns `falseValue`.
- `toInt()` – Converts the boolean to an integer (1 for true, 0 for false).
- `toYesNo({trueString, falseString})` – Converts to a string representation with customizable values.
- `not` – Returns the negation of the boolean (equivalent to `!this`).

```dart
// Examples
true.choose('Active', 'Inactive'); // 'Active'
false.choose('Active', 'Inactive'); // 'Inactive'
true.toInt(); // 1
false.toInt(); // 0
true.toYesNo(); // 'Yes'
false.toYesNo(trueString: 'On', falseString: 'Off'); // 'Off'
true.not; // false
```

-------------------------------------------------------------------------------

### 🗓️ DateTime Extensions

#### ✅ Checkers
- `isAfternoon` – Checks if the time is between 12:00 PM and 5:59 PM.

- `isMorning` – Checks if the time is before 12:00 PM.
- `isEvening` – Checks if the time is between 6:00 PM and 11:59 PM.
- `isNight` – Checks if the time is between midnight and 5:59 AM.
- `isToday` / `isTomorrow` / `isYesterday` – Quickly check the relation to the current day.
- `isSameDay(DateTime other)` – Returns `true` if the date is the same calendar day as `other`.
- `isInPast` / `isInFuture` – Check if the datetime is before or after now.

#### 🔧 Utilities
- `startOfDay()` – Returns the start of the day (midnight) for the datetime.

#### 🔧 Manipulators
- `addDays(int)` / `addMonths(int)` / `addYears(int)` – Add to the datetime.

- `addHours(int)` / `addMinutes(int)` / `addSeconds(int)` – Add smaller units.
- `subDays(int)` / `subMonths(int)` / `subYears(int)` – Subtract from the datetime.
- `subHours(int)` / `subMinutes(int)` / `subSeconds(int)` – Subtract smaller units.

#### 🔢 Age
- `toAge()` – Convert the date to an age in years.

- `isAgeOlder(age)` / `isAgeYounger(age)` / `isAgeEqualTo(age)` – Check against an age.
- `isAgeBetween(min, max)` – Check if the age is within a given range.

#### 🧠 Time to String

- `format(String format)` – Fully custom format using `intl`.
  > Popular date and time formats included in the [MayrDateTimeFormats] class.
  >
  > Currently includes:
  > - `MayrDateTimeFormats.ukDate` - dd/MM/yyyy
  > - `MayrDateTimeFormats.ukDateTime` - dd/MM/yyyy HH:mm:ss
  > - `MayrDateTimeFormats.usDate` - yyyy-MM-dd
  > - `MayrDateTimeFormats.usDateTime` - yyyy-MM-dd HH:mm:ss
  > - `MayrDateTimeFormats.time` - HH:mm:ss
  > - `MayrDateTimeFormats.timeNoSecs` - HH:mm

- `toDayOrdinal()` – Get the day of the month with ordinal (e.g. `1st`, `22nd`, `31st`).
- `toTimeAgoString()` – Human-readable "time ago" format (e.g. "2 days ago").
- `toTimeString()` – Convert to time only (e.g. `14:35` or `14:35:59`).
- `toShortDate()` – Returns a short formatted date string (e.g. `Wed 15th Jan`).

-------------------------------------------------------------------------------

### ⏳ Duration Extensions

- `delay([callback])` – Delays execution for the given duration. Optionally accepts a callback to run after the delay.
- `toReadableString()` – Returns a human-readable string representation (e.g., '2h 30m', '1d 5h 30m').
- `isLongerThan(other)` – Checks if this duration is longer than another duration.
- `isShorterThan(other)` – Checks if this duration is shorter than another duration.

```dart
// Example
await 2.seconds.delay(() {
  print('Delayed by 2 seconds');
});

final duration = Duration(hours: 2, minutes: 30);
print(duration.toReadableString()); // '2h 30m'

5.seconds.isLongerThan(3.seconds); // true
3.seconds.isShorterThan(5.seconds); // true
```

-------------------------------------------------------------------------------

### 🔷 Object Extensions

- `let(transform)` – Executes a function with this object as its argument and returns the result. Useful for chaining operations or transforming values inline.
- `also(action)` – Executes a function with this object and returns this object. Useful for performing side effects while maintaining the original value for further chaining.

```dart
// Examples
final result = 'hello'.let((it) => it.toUpperCase()); // 'HELLO'
final length = 'test'.let((it) => it.length); // 4

final user = User('John')
  .also((it) => print('Created user: ${it.name}'))
  .also((it) => log.info('User created'));
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
- `orDefault(T fallback)` - Returns the fallback value if the provided value is null

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
- `isBetween(min, max)` – Checks if the number is within a range (inclusive).
- `isPositive` – Returns `true` if the number is greater than zero.
- `isNegativeNumber` – Returns `true` if the number is less than zero.
- `isZero` – Returns `true` if the number equals zero.

#### 🔢 Integer Extensions
- `isEvenNumber` – Checks if the integer is even.
- `isOddNumber` – Checks if the integer is odd.
- `times(action)` – Repeats an action n times.
- `timesIndexed(action)` – Repeats an action n times with the current index.

```dart
// Example
5.isBetween(1, 10); // true
3.times(() => print('Hello')); // Prints 'Hello' 3 times
3.timesIndexed((i) => print('Index: $i')); // Prints indices 0, 1, 2
```

#### 🎲 Random Generators
- `randomLess({min = 1.0})` – For `int` or `double`, generates a random value **less than** the current one, starting from the `min`.

- `randomMore(max)` – Generates a random value **greater than** the current one, up to `max`.

```dart
10.randomLess(); // e.g. returns 3, 7, etc.
5.5.randomMore(10.0); // e.g. returns 6.23, etc.
```

#### 🎯 Double Extensions
- `toDecimalPlaces(places)` – Rounds the double to a specified number of decimal places.

```dart
3.14159.toDecimalPlaces(2); // 3.14
3.14159.toDecimalPlaces(4); // 3.1416
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
- `copyToClipboard()` - Copies the string to clipboard.

- `matchesRegExp(regex)` – Checks if the string matches a given regular expression.
- `toBool` – Converts `"true"` or `"false"` to a boolean.
- `toDateTime()` – Parses the string into a `DateTime` object. Returns null if parse fails
- `toRegExp()` – Converts the string into a `RegExp`.
- `toUri()` - Attempts to parse the string to a `Uri`
- `limit(maxLength, [overflow = "…"])` – Limits string length with optional overflow characters.
- `mask({start = 2, end = 2, maskChar = '*', maskLength})` – Masks the middle of the string, leaving edges visible.
  ```dart
  '08012345678'.mask(); // 08*******78
  '08012345678'.mask(maskLength: 2); // 08**78
  ```
- `reverse()` – Reverses the string.
- `isBlank` / `isNotBlank` – Checks if the string is empty or contains only whitespace.
- `removeWhitespace()` – Removes all whitespace from the string.
- `countOccurrences(substring)` – Counts how many times a substring appears.
- `truncate(maxLength, {ellipsis})` – Truncates the string with word boundary awareness.
- `wrap(prefix, [suffix])` – Wraps the string with a prefix and optional suffix.
- `removePrefix(prefix)` – Removes a prefix if it exists.
- `removeSuffix(suffix)` – Removes a suffix if it exists.

```dart
// Examples
'hello'.reverse(); // 'olleh'
'  '.isBlank; // true
'hello world'.removeWhitespace(); // 'helloworld'
'hello world'.countOccurrences('l'); // 3
'The quick brown fox'.truncate(10); // 'The quick...'
'text'.wrap('"'); // '"text"'
'Hello World'.removePrefix('Hello '); // 'World'
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

### 🧩 Iterable / List Extensions

#### Query & Search

- `firstOrNull()` → Returns first element or `null` if empty
- `lastOrNull()` → Returns last element or `null` if empty
- `singleWhereOrNull(predicate)` → Returns match or `null`
- `containsWhere(predicate)` → Boolean check
- `indexWhereOrNull(predicate)` → Returns index or `null`

```dart
// Examples
[1, 2, 3].firstOrNull(); // 1
[].firstOrNull(); // null
[1, 2, 3].singleWhereOrNull((e) => e == 2); // 2
[1, 2, 3].containsWhere((e) => e > 2); // true
```

#### Safe Access

- `getOrNull(index)` → Returns element at index or `null`
- `getOrDefault(index, defaultValue)` → Returns element or default value

```dart
// Examples
[1, 2, 3].getOrNull(1); // 2
[1, 2, 3].getOrNull(5); // null
[1, 2, 3].getOrDefault(5, 0); // 0
```

#### Transformations

- `chunked(size)` → Splits into chunks
- `mapIndexed((index, item) => ...)` → Maps with index
- `whereNotNull()` → Filters out nulls
- `distinctBy(keySelector)` → Unique items by property
- `flatten()` → Flattens nested lists
- `sortedBy(keySelector)` / `sortedByDesc(keySelector)` → Sort by property
- `flip()` → Reverses the list

```dart
// Examples
[1, 2, 3, 4, 5].chunked(2); // [[1, 2], [3, 4], [5]]
['a', 'b', 'c'].mapIndexed((i, e) => '$i: $e'); // ['0: a', '1: b', '2: c']
[1, null, 2, null, 3].whereNotNull(); // [1, 2, 3]
[[1, 2], [3, 4]].flatten(); // [1, 2, 3, 4]
[1, 2, 3].flip(); // [3, 2, 1]
```

#### Aggregations (Only available on list of numbers)

- `sumBy(num Function(T))` → Sum elements by selector
- `averageBy(num Function(T))` → Average by selector
- `min()` → Minimum value
- `max()` → Maximum value
- `countWhere(predicate)` → Count matching elements

```dart
// Examples
[1, 2, 3, 4, 5].sumBy((e) => e); // 15
[1, 2, 3, 4, 5].averageBy((e) => e); // 3.0
[3, 1, 4, 1, 5].min(); // 1
[3, 1, 4, 1, 5].max(); // 5
[1, 2, 3, 4, 5].countWhere((e) => e > 3); // 2
```

#### Mutation Helpers (returns new copy)

- `insertIf(condition, value)` → Insert conditionally
- `replaceWhere(predicate, newValue)` → Replace matching elements
- `removeWhereNot(predicate)` → Keep only matching elements
- `updateWhere(predicate, updater)` → Update matching elements
- `addIf(value)` / `addAllIf(values)` → Add conditionally
- `append(value)` / `appendAll(values)` → Append elements
- `appendIf(value)` / `appendAllIf(values)` → Append conditionally
- `pop()` → Remove and return last element
- `fliter(predicate)` → Filter elements
- `unique()` → Get unique elements

```dart
// Examples
[1, 2, 3].insertIf(true, 4); // [1, 2, 3, 4]
[1, 2, 3, 2].replaceWhere((e) => e == 2, 5); // [1, 5, 3, 5]
[1, 2, 3, 4, 5].removeWhereNot((e) => e > 2); // [3, 4, 5]
[1, 2, 2, 3, 3, 4].unique(); // [1, 2, 3, 4]
```

#### Utility

- `isNullOrEmpty()` → Check if empty
- `joinToString(separator, transform)` → Join with custom format
- `forEachIndexed()` → Iterate with index

```dart
// Examples
[].isNullOrEmpty(); // true
[1, 2, 3].joinToString(separator: ', '); // '1, 2, 3'
['a', 'b'].forEachIndexed((i, e) => print('$i: $e'));
```

-------------------------------------------------------------------------------

### 🗺️ Map Extensions

#### Safe Access

- `getOrNull(key)` → Get value or null
- `getOrDefault(key, defaultValue)` → Get value or default

```dart
// Examples
{'a': 1, 'b': 2}.getOrNull('a'); // 1
{'a': 1, 'b': 2}.getOrNull('c'); // null
{'a': 1, 'b': 2}.getOrDefault('c', 0); // 0
```

#### Transformations

- `mapKeys((k, v) => newKey)` → Transform keys
- `mapValues((k, v) => newValue)` → Transform values
- `filterKeys(predicate)` → Filter by keys
- `filterValues(predicate)` → Filter by values
- `invert()` → Swap keys and values

```dart
// Examples
{'a': 1, 'b': 2}.mapKeys((k, v) => k.toUpperCase()); // {'A': 1, 'B': 2}
{'a': 1, 'b': 2}.mapValues((k, v) => v * 2); // {'a': 2, 'b': 4}
{'a': 1, 'b': 2}.invert(); // {1: 'a', 2: 'b'}
```

#### Merge & Combine

- `merge(otherMap)` → Merge with precedence
- `mergeIfAbsent(otherMap)` → Merge without overriding
- `combine(other, (k, v1, v2) => mergedValue)` → Custom merge

```dart
// Examples
{'a': 1, 'b': 2}.merge({'b': 3, 'c': 4}); // {'a': 1, 'b': 3, 'c': 4}
{'a': 1, 'b': 2}.mergeIfAbsent({'b': 3, 'c': 4}); // {'a': 1, 'b': 2, 'c': 4}
```

#### Utility

- `keysWhere(predicate)` → Get keys matching predicate
- `valuesWhere(predicate)` → Get values matching predicate
- `toQueryString()` → Convert to URL query string

```dart
// Examples
{'a': 1, 'b': 2, 'c': 3}.keysWhere((v) => v > 1); // ['b', 'c']
{'name': 'John', 'age': '30'}.toQueryString(); // 'name=John&age=30'
```

-------------------------------------------------------------------------------

### 🔢 Set Extensions

- `toggle(element)` → Adds if missing, removes if present
- `intersects(otherSet)` → Check for intersection
- `isSubsetOf(otherSet)` → Check if subset
- `isSupersetOf(otherSet)` → Check if superset
- `unionAll(sets)` → Union of multiple sets
- `without(element)` → Remove element

```dart
// Examples
{1, 2, 3}.toggle(2); // {1, 3}
{1, 2, 3}.toggle(4); // {1, 2, 3, 4}
{1, 2, 3}.intersects({2, 3, 4}); // true
{1, 2}.isSubsetOf({1, 2, 3}); // true
{1, 2}.unionAll([{2, 3}, {3, 4}]); // {1, 2, 3, 4}
```

-------------------------------------------------------------------------------

### 🎯 Humanize Extensions

The goal of `humanize` is simple:

> Convert technical or numeric values into **readable, natural, human-friendly strings**.

Where computers speak in seconds, bytes, and counts, `humanize` translates them into something that sounds like it came from a person.

#### Durations

- `.humanize(locale)` → "2 hours, 3 minutes"

```dart
// Examples
Duration(hours: 2, minutes: 3).humanize(); // '2 hours, 3 minutes'
Duration(days: 1).humanize(); // '1 day'
Duration(seconds: 45).humanize(); // '45 seconds'
```

#### Time (DateTime)

- `.humanize(locale)` → "just now", "3 hours ago", "yesterday", "last week", "3 days from now", "2 weeks ago"

```dart
// Examples
DateTime.now().humanize(); // 'just now'
DateTime.now().subtract(Duration(hours: 3)).humanize(); // '3 hours ago'
DateTime.now().subtract(Duration(days: 1)).humanize(); // 'yesterday'
DateTime.now().add(Duration(days: 2)).humanize(); // 'in 2 days'
```

#### Numbers

- `humanizeNumber()` → "15.3k", "1.5M"
- `humanizeOrdinal()` → "1st", "2nd", "3rd"
- `humanizeCount('item')` → "1 item" / "3 items"
- `humanizePercentage(max, min)` → "74%"
- `humanizeFileSize()` → "1.0 MB", "520.3 KB"

```dart
// Examples
1234.humanizeNumber(); // '1.2k'
1500000.humanizeNumber(); // '1.5M'
1.humanizeOrdinal(); // '1st'
21.humanizeOrdinal(); // '21st'
3.humanizeCount('item'); // '3 items'
0.75.humanizePercentage(); // '75%'
1024.humanizeFileSize(); // '1.0 KB'
520300.humanizeFileSize(); // '508.1 KB'
```

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

### 📜 DateTimeFormat

This package also include some common date time formats. These inlude:
- `MayrDateTimeFormats.ukDate`
- `MayrDateTimeFormats.usDate`
- `MayrDateTimeFormats.time`
- `MayrDateTimeFormats.timeNoSecs`
- `MayrDateTimeFormats.ukDateTime`
- `MayrDateTimeFormats.usDateTime`

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
