# 🔤 String Extensions

Comprehensive utilities for string manipulation, parsing, and formatting.

## ✅ Utilities

- `copyToClipboard()` - Copies the string to clipboard
- `matchesRegExp(regex)` – Checks if the string matches a given regular expression
- `toBool` – Converts `"true"` or `"false"` to a boolean
- `toDateTime()` – Parses the string into a `DateTime` object. Returns null if parse fails
- `toRegExp()` – Converts the string into a `RegExp`
- `toUri()` - Attempts to parse the string to a `Uri`
- `limit(maxLength, [overflow = "…"])` – Limits string length with optional overflow characters
- `mask({start = 2, end = 2, maskChar = '*', maskLength})` – Masks the middle of the string, leaving edges visible
- `reverse()` – Reverses the string
- `isBlank` / `isNotBlank` – Checks if the string is empty or contains only whitespace
- `removeWhitespace()` – Removes all whitespace from the string
- `countOccurrences(substring)` – Counts how many times a substring appears
- `truncate(maxLength, {ellipsis})` – Truncates the string with word boundary awareness
- `wrap(prefix, [suffix])` – Wraps the string with a prefix and optional suffix
- `removePrefix(prefix)` – Removes a prefix if it exists
- `removeSuffix(suffix)` – Removes a suffix if it exists

### Examples

```dart
'hello'.reverse(); // 'olleh'
'  '.isBlank; // true
'hello world'.removeWhitespace(); // 'helloworld'
'hello world'.countOccurrences('l'); // 3
'The quick brown fox'.truncate(10); // 'The quick...'
'text'.wrap('"'); // '"text"'
'Hello World'.removePrefix('Hello '); // 'World'

// Masking
'08012345678'.mask(); // 08*******78
'08012345678'.mask(maskLength: 2); // 08**78
```

## 🎀 Pretty Printing

- `prettyJson()` – Formats a raw JSON string
- `prettyXml()` – Formats raw XML into readable indents
- `prettyYaml()` – Formats YAML strings prettily

## 🔠 Casing

Transform strings to different cases:

- `camelCase` – Converts string to camelCase
- `capitalised` – Capitalises the first letter of each word
- `kebabCase` – Converts string to kebab-case
- `pascalCase` – Converts string to PascalCase
- `snakeCase` – Converts string to snake_case
- `titleCase` – Converts string to Title Case

### Examples

```dart
'the big brown fox'.camelCase; // theBigBrownFox
'the big brown fox'.capitalised; // The big brown fox
'the big brown fox'.pascalCase; // TheBigBrownFox
'the big brown fox'.kebabCase; // the-big-brown-fox
'the big brown fox'.snakeCase; // the_-_big_-_brown_-_fox
'the big brown fox'.titleCase; // The Big Brown Fox
```

## 🧪 Case and Pattern Checkers

### Case Checkers

- `isCamelCase`
- `isPascalCase`
- `isSnakeCase`
- `isKebabCase`
- `isTitleCase`
- `isCapitalised`
- `isUpperCase`
- `isLowerCase`

### Pattern Checkers

- `isEmail`
- `isURL`
- `isUlid`
- `isUuid`
- `isSlug`
- `isHexColor`
- `isIPAddress`
- `isNum` – Validates numeric string
- `isAlphabetOnly`
- `isNumericOnly`

## Back to Documentation

[← Back to main documentation](./README.md)
