part of './../extensions.dart';

extension MayrPrettyStringExtensions on String {
  String prettyJson() =>
      const JsonEncoder.withIndent('  ').convert(jsonDecode(this));

  String prettyXml() => XmlDocument.parse(this).toXmlString(pretty: true);

  String prettyYaml() =>
      const JsonEncoder.withIndent('  ').convert(loadYaml(this));
}

extension MayrStringCasingExtensions on String {
  /// Converts to camelCase
  String get camelCase =>
      _cleanWords.first.toLowerCase() +
      _cleanWords.skip(1).map((w) => w.capitalised).join('');

  /// Capitalises only the first letter
  String get capitalised =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';

  /// Converts to kebab-case
  String get kebabCase => _cleanWords.join('-').toLowerCase();

  /// Converts to PascalCase
  String get pascalCase => _cleanWords.map((w) => w.capitalised).join('');

  /// Converts to snake_case
  String get snakeCase => _cleanWords.join('_').toLowerCase();

  /// Converts to Title Case
  String get titleCase =>
      split(RegExp(r'[\s_\-]+')).map((word) => word.capitalised).join(' ');

  List<String> get _cleanWords {
    return toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '') // Remove punctuation
        .replaceAllMapped(
          RegExp(r'([a-z0-9])([A-Z])'),
          (m) => '${m[1]} ${m[2]}',
        ) // camel case splitter
        .split(RegExp(r'[\s\-_]+')) // split by spaces, underscores, hyphens
        .where((w) => w.trim().isNotEmpty)
        .toList();
  }
}

extension MayrStringCompareExtensions on String {
  bool get isCamelCase => camelCase == this;

  bool get isCapitalised => capitalised == this;

  bool get isKebabCase => kebabCase == this;

  bool get isLowerCase => this == toLowerCase();

  bool get isNum => num.tryParse(this) is num;

  bool get isPascalCase => pascalCase == this;

  bool get isSnakeCase => snakeCase == this;

  bool get isTitleCase => titleCase == this;

  bool get isUpperCase => this == toUpperCase();
}

extension MayrStringExtensions on String {
  /// Copies the string to clipboard
  void copyToClipboard() async =>
      await Clipboard.setData(ClipboardData(text: this));

  /// Checks if the string matches the given regex
  bool matchesRegExp(String regex) => regex.toRegExp().hasMatch(this);

  /// Attempts to convert the string to a boolean.
  ///
  /// #### `'true'`, `'yes'`, `'y'` and `1` equates to `true`
  /// #### `'false'`, `'no'`, `'n'` and `0` equates to `false`
  /// All other strings throw an `UnsupportedError` exception
  /// unless `fallback` is provided, in which case it would be returned
  bool toBool([bool? fallback]) {
    if (["true", "yes", "y", "1"].contains(toLowerCase())) return true;

    if (["false", "no", "n", "0"].contains(toLowerCase())) return false;

    if (fallback != null) return fallback;

    throw UnsupportedError("Cannot convert $this to a boolean");
  }

  /// Attempt to convert a [String] to a [DateTime].
  DateTime? toDateTime() => DateTime.tryParse(this);

  /// Converts a string to a [RegExp]
  RegExp toRegExp() => RegExp(this);

  /// Attempt to convert a string to a Uri.
  ///
  /// `Null` is returned when the string cannot be parsed
  Uri? toUri() => Uri.tryParse(this);

  /// Limit the string to a maximum length with optional overflow indicator.
  ///
  /// Returns the full string if it's within [maxLength],
  /// otherwise truncates and appends [overflow] (default: "...").
  ///
  /// Example:
  /// ```dart
  /// 'Hello World'.limit(5); // 'Hello...'
  /// 'Hi'.limit(5); // 'Hi'
  /// ```
  String limit(int maxLength, [String overflow = "..."]) =>
      length <= maxLength ? this : substring(0, maxLength) + overflow;

  /// Mask the string by replacing characters with a mask character.
  ///
  /// The [start] and [end] parameters define how many characters
  /// to keep visible at the beginning and end of the string.
  /// [maskChar] is the character used for masking (default: '*').
  /// [maskLength] can be used to set a fixed mask length.
  ///
  /// Example:
  /// ```dart
  /// 'secret@email.com'.mask(); // 'se**************om'
  /// 'secret@email.com'.mask(maskLength: 5); // 'se*****om'
  /// ```
  String mask({
    int start = 2,
    int end = 2,
    String maskChar = '*',
    int? maskLength,
  }) {
    if (length <= start + end) return this;

    maskLength ??= length - start - end;

    String masked = List.filled(maskLength, maskChar).join();

    return [substring(0, start), masked, substring(length - end)].join();
  }

  /// Reverses the string.
  ///
  /// Example:
  /// ```dart
  /// 'hello'.reverse(); // 'olleh'
  /// ```
  String reverse() => split('').reversed.join('');

  /// Checks if the string is empty or contains only whitespace.
  bool get isBlank => trim().isEmpty;

  /// Checks if the string is not empty and contains non-whitespace characters.
  bool get isNotBlank => !isBlank;

  /// Removes all whitespace from the string.
  ///
  /// Example:
  /// ```dart
  /// 'hello world'.removeWhitespace(); // 'helloworld'
  /// ```
  String removeWhitespace() => replaceAll(RegExp(r'\s+'), '');

  /// Counts the number of occurrences of a substring within the string.
  ///
  /// Example:
  /// ```dart
  /// 'hello world'.countOccurrences('l'); // 3
  /// 'hello world'.countOccurrences('o'); // 2
  /// ```
  int countOccurrences(String substring) {
    if (substring.isEmpty) return 0;
    int count = 0;
    int index = 0;
    while ((index = indexOf(substring, index)) != -1) {
      count++;
      index += substring.length;
    }
    return count;
  }

  /// Truncates the string to a specified length and adds an ellipsis if needed.
  ///
  /// This is similar to [limit] but ensures word boundaries are respected
  /// when possible.
  ///
  /// Example:
  /// ```dart
  /// 'The quick brown fox'.truncate(10); // 'The quick...'
  /// ```
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;

    final truncated = substring(0, maxLength);
    final lastSpace = truncated.lastIndexOf(' ');

    // If we found a space and it's not too far from the end, break there
    if (lastSpace > maxLength * 0.7) {
      return '${truncated.substring(0, lastSpace)}$ellipsis';
    }

    return '$truncated$ellipsis';
  }

  /// Wraps the string with the specified prefix and suffix.
  ///
  /// Example:
  /// ```dart
  /// 'text'.wrap('"'); // '"text"'
  /// 'text'.wrap('[', ']'); // '[text]'
  /// ```
  String wrap(String prefix, [String? suffix]) {
    suffix ??= prefix;
    return '$prefix$this$suffix';
  }

  /// Removes the specified prefix from the string if it exists.
  ///
  /// Example:
  /// ```dart
  /// 'Hello World'.removePrefix('Hello '); // 'World'
  /// ```
  String removePrefix(String prefix) {
    if (startsWith(prefix)) {
      return substring(prefix.length);
    }
    return this;
  }

  /// Removes the specified suffix from the string if it exists.
  ///
  /// Example:
  /// ```dart
  /// 'Hello World'.removeSuffix(' World'); // 'Hello'
  /// ```
  String removeSuffix(String suffix) {
    if (endsWith(suffix)) {
      return substring(0, length - suffix.length);
    }
    return this;
  }
}

extension MayrStringPatternComparisonExtensions on String {
  bool get isAlphabetOnly => matchesRegExp(r'^[a-zA-Z]+$');

  bool get isEmail => matchesRegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  bool get isHexColor => matchesRegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');

  bool get isIPAddress => matchesRegExp(
    r'^((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?)$',
  );

  bool get isNumericOnly => matchesRegExp(r'^\d+$');

  bool get isSlug => matchesRegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)*$');

  bool get isUlid => toUpperCase().matchesRegExp(r'^[0-9A-HJKMNP-TV-Z]{26}$');

  bool get isUpperCase => this == toUpperCase();

  bool get isURL => matchesRegExp(
    r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
  );

  bool get isUuid => matchesRegExp(
    r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$',
  );
}
