part of './../extensions.dart';

extension PrettyStringExtensions on String {
  String prettyJson() =>
      const JsonEncoder.withIndent('  ').convert(jsonDecode(this));

  String prettyXml() => XmlDocument.parse(this).toXmlString(pretty: true);

  String prettyYaml() =>
      const JsonEncoder.withIndent('  ').convert(loadYaml(this));
}

extension StringCasingExtensions on String {
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

extension StringCompareExtensions on String {
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

extension StringExtensions on String {
  bool matchesRegExp(String regex) => regex.toRegExp().hasMatch(this);

  bool toBool([bool? fallback]) {
    if (["true", "yes", "y", "1"].contains(toLowerCase())) return true;

    if (["false", "no", "n", "0"].contains(toLowerCase())) return false;

    if (fallback != null) return fallback;

    throw UnsupportedError("Cannot convert $this to a boolean");
  }

  /// Attempt to convert a [String] to a [DateTime].
  DateTime toDateTime() => DateTime.parse(this);

  RegExp toRegExp() => RegExp(this);

  String limit(int maxLength, [String overflow = "..."]) =>
      length <= maxLength ? this : substring(0, maxLength) + overflow;

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
}

extension StringPatternComparisonExtensions on String {
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
