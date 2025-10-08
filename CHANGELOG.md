# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - Doc Fix

### Improved
- Reverted the documentation for the package back to the README.md as the doc/ was not getting linked by pub.dev

## [1.0.0] - Major Release with New Extensions

### Added

#### Iterable/List Extensions
- **Query & Search:**
  - `firstOrNull()` - Returns first element or `null` if empty
  - `lastOrNull()` - Returns last element or `null` if empty
  - `singleWhereOrNull(predicate)` - Returns match or `null`
  - `containsWhere(predicate)` - Boolean check
  - `indexWhereOrNull(predicate)` - Returns index or `null`

- **Safe Access:**
  - `getOrNull(index)` - Returns element at index or `null`
  - `getOrDefault(index, defaultValue)` - Returns element or default value

- **Transformations:**
  - `chunked(size)` - Splits into chunks
  - `mapIndexed((index, item) => ...)` - Maps with index
  - `whereNotNull()` - Filters out nulls
  - `distinctBy(keySelector)` - Unique items by property
  - `flatten()` - Flattens nested lists
  - `sortedBy(keySelector)` / `sortedByDesc(keySelector)` - Sort by property
  - `flip()` - Reverses the list

- **Aggregations (for numbers):**
  - `sumBy(num Function(T))` - Sum elements by selector
  - `averageBy(num Function(T))` - Average by selector
  - `countWhere(predicate)` - Count matching elements

- **Mutation Helpers (returns new copy):**
  - `insertIf(condition, value)` - Insert conditionally
  - `replaceWhere(predicate, newValue)` - Replace matching elements
  - `removeWhereNot(predicate)` - Keep only matching elements
  - `updateWhere(predicate, updater)` - Update matching elements
  - `addIf(value)` / `addAllIf(values)` - Add conditionally
  - `append(value)` / `appendAll(values)` - Append elements
  - `appendIf(value)` / `appendAllIf(values)` - Append conditionally
  - `pop()` - Remove and return last element
  - `fliter(predicate)` - Filter elements (alias for where)
  - `unique()` - Get unique elements

- **Utility:**
  - `isNullOrEmpty()` - Check if empty
  - `joinToString(separator, transform)` - Join with custom format
  - `forEachIndexed()` - Iterate with index

#### Map Extensions
- **Safe Access:**
  - `getOrNull(key)` - Get value or null
  - `getOrDefault(key, defaultValue)` - Get value or default

- **Transformations:**
  - `mapKeys((k, v) => newKey)` - Transform keys
  - `mapValues((k, v) => newValue)` - Transform values
  - `filterKeys(predicate)` - Filter by keys
  - `filterValues(predicate)` - Filter by values
  - `invert()` - Swap keys and values

- **Merge & Combine:**
  - `merge(otherMap)` - Merge with precedence
  - `mergeIfAbsent(otherMap)` - Merge without overriding
  - `combine(other, (k, v1, v2) => mergedValue)` - Custom merge

- **Utility:**
  - `keysWhere(predicate)` - Get keys matching predicate
  - `valuesWhere(predicate)` - Get values matching predicate
  - `toQueryString()` - Convert to URL query string

#### Set Extensions
- `toggle(element)` - Add if missing, remove if present
- `intersects(otherSet)` - Check for intersection
- `isSubsetOf(otherSet)` - Check if subset
- `isSupersetOf(otherSet)` - Check if superset
- `unionAll(sets)` - Union of multiple sets
- `without(element)` - Remove element

#### Humanize Extensions
- **Duration:**
  - `humanize(locale)` - Convert to "2 hours, 3 minutes" format

- **DateTime:**
  - `humanize(locale)` - Convert to relative time ("just now", "3 hours ago", "yesterday", "last week", etc.)

- **Numbers:**
  - `humanizeNumber()` - Format as "15.3k", "1.5M", etc.
  - `humanizeOrdinal()` - Format as "1st", "2nd", "3rd", etc.
  - `humanizeCount('item')` - Format as "1 item" / "3 items"
  - `humanizePercentage(max, min)` - Format as "74%"
  - `humanizeFileSize()` - Format as "1.0 MB", "520.3 KB", etc.

### Changed
- Updated package version to 1.0.0 marking stable release

### Improved
- Added comprehensive test coverage for all new extensions
- Complete documentation with examples for all methods
- Enhanced type safety with proper generic constraints

## [Unreleased]

### Improved
- Added comprehensive test coverage for DateTime extensions
  - Tests for all manipulation methods (addDays, addMonths, addYears, subDays, etc.)
  - Tests for check methods (isToday, isTomorrow, isYesterday, isInFuture, isInPast)
  - Tests for formatting methods (format, toTimeString, toShortDate, toDayOrdinal)
  - Tests for time of day checks (isMorning, isAfternoon, isEvening, isNight)
  - Tests for age calculations (toAge, isAgeOlder, isAgeYounger, isAgeBetween)

## [0.4.0] - 6th October, 2025

### Added
- **String Extensions:**
  - `reverse()` - Reverses the string
  - `isBlank` and `isNotBlank` - Check if string is empty or contains only whitespace
  - `removeWhitespace()` - Removes all whitespace from the string
  - `countOccurrences(substring)` - Counts occurrences of a substring
  - `truncate(maxLength)` - Truncates with word boundary awareness
  - `wrap(prefix, suffix)` - Wraps string with prefix and suffix
  - `removePrefix(prefix)` and `removeSuffix(suffix)` - Remove specific prefix or suffix

- **Number Extensions:**
  - `toDecimalPlaces(places)` - Rounds double to specified decimal places
  - `isBetween(min, max)` - Checks if number is within range
  - `isPositive`, `isNegativeNumber`, `isZero` - Number sign checks
  - `isEvenNumber` and `isOddNumber` - Parity checks for integers
  - `times(action)` - Repeat an action n times
  - `timesIndexed(action)` - Repeat an action n times with index

- **Bool Extensions:**
  - `choose(trueValue, falseValue)` - Select value based on boolean
  - `toInt()` - Convert to integer (1 for true, 0 for false)
  - `toYesNo()` - Convert to string with customizable true/false values
  - `not` - Returns the negation of the boolean

- **Duration Extensions:**
  - `toReadableString()` - Human-readable duration format (e.g., '2h 30m')
  - `isLongerThan(other)` - Compare durations
  - `isShorterThan(other)` - Compare durations

- **Object Extensions:**
  - `let(transform)` - Transform object inline with function
  - `also(action)` - Execute side effects while maintaining object for chaining

### Changed
- Enhanced all extension methods with comprehensive dartdoc documentation
- Improved code comments and examples throughout
- Applied DRY (Don't Repeat Yourself) principle by consolidating common patterns
- Enhanced modularity by ensuring each extension has a single responsibility (SRP)

### Improved
- Added extensive test coverage for all new methods
- Documentation now includes usage examples for better developer experience
- Code structure follows KISS (Keep It Simple, Stupid) principle
- Enhanced Dynamic/Nullable extensions with better documentation

## [0.3.1]

- Automated deployments

## [0.3.0] - 30th April, 2025

### Added
- `context.platformInLightMode`
- `dateTime.startOfDay()`
- `MayrDateTimeFormats`: A collection of popular datetime formats
- Slightly more tests and dartdocs

### Changed
- `dateTime.toFormat(...)` -> `dateTime.format(...)`
- `dateTime.isYesterday()`, `dateTime.isToday()`, and `dateTime.isTomorrow()` are now getter properties:
  - `dateTime.isYesterday`
  - `dateTime.isToday`
  - `dateTime.isTomorrow`
- `dateTime.isInPast()` and `dateTime.isInFuture()` are also now getter properties:
  - `dateTime.isInPast`
  - `dateTime.isInFuture`

### Removed
- `dateTime.toDateString(...)`
- `dateTime.toDateStringUK(...)`
- `dateTime.toDateStringUS(...)`
- `dateTime.toDateTimeString(...)`
- `dateTime.isExpired()`

## [0.2.0] - [29-04-2025]

### Added
- `T?.orDefault(T fallback)` Added
- `String.copyToClipboard()` Added
- `String.toUri()` Added
- More dartdocs to properties and methods

### Changed
- `String.toDateTime()` now uses tryParse, so null is returned if parse fails and error is not thrown
- Added namespaces to extensions to prevent clash with user extensions


## [0.1.1] - Minor cleanups

### Changed
- Removed certain files that are not required to use package from pub


## [0.1.0] - Rebrand to mayr_*

### Changed
- Package name was rebranded from `flutter_util_extensions` to `mayr_extensions`


## [0.0.2]

### Changed
- Relaxed `intl` dependency constraint to `>=0.19.0 <0.21.0` for wider compatibility.


## [0.0.1] - Initial Release

### Added
- BuildContext extensions:
  - Access to form, navigator, overlay, scaffold, media query, brightness, platform checks, and widget size.
  - Device type checks (phone, tablet, desktop).
  - Added `showSnackBar()` utility method.
- DateTime extensions:
  - Checkers for time of day, expiry, and comparisons.
  - Manipulators to add/subtract dates, months, years, etc.
  - Conversions to various string formats and age calculation.
- Duration extension:
  - `delay()` method for simple async delays.
- Dynamic extensions:
  - `nullOnDebug()`, `onlyOnDebug()`, and `maybe()` based on probability.
- Image extension:
  - Easily create a `CircleAvatar` widget with an image.
- Number extensions:
  - Comparison helpers, random number generators, number formatters, and conversions to Duration.
- String extensions:
  - Pattern matching, parsing to different cases (camelCase, snakeCase, etc.), and pretty printing (JSON, YAML, XML).
  - Pattern checkers for emails, URLs, IP addresses, and more.
- Widget extensions:
  - Helpers for padding, sizing, positioning, clipping, visibility, and touch management via `InkWellManager`.

### Notes
- First public release.
- Still evolving — contributions and feedback welcome!

---
