# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

### Changed
- Enhanced all extension methods with comprehensive dartdoc documentation
- Improved code comments and examples throughout
- Applied DRY (Don't Repeat Yourself) principle by consolidating common patterns
- Enhanced modularity by ensuring each extension has a single responsibility (SRP)

### Improved
- Added extensive test coverage for all new methods
- Documentation now includes usage examples for better developer experience
- Code structure follows KISS (Keep It Simple, Stupid) principle

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
