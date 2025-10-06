import 'package:flutter_test/flutter_test.dart';

import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("To bool works correctly", () {
    expect("true".toBool(), true);
    expect("yes".toBool(), true);
    expect("y".toBool(), true);
    expect("1".toBool(), true);

    expect("false".toBool(), false);
    expect("no".toBool(), false);
    expect("n".toBool(), false);
    expect("0".toBool(), false);

    expect("not a bool".toBool, throwsUnsupportedError);

    expect("not a bool".toBool(true), true);
    expect("not a bool".toBool(false), false);
  });

  test("isAlphabetOnlyWorks", () {
    expect("IamAlphabetOnly".isAlphabetOnly, true);
    expect("IamAlphabet+Sign".isAlphabetOnly, false);
    expect("IamAlphabet+ Space".isAlphabetOnly, false);
    expect("IamAlphabet+ 1 number".isAlphabetOnly, false);
  });

  test("isEmail", () {
    expect("youngmayor.dev@gmail.com".isEmail, true);
    expect("youngmayor..dev@gmail.com".isEmail, false);
    expect("youngmayor.dev@@gmail.com".isEmail, false);
    expect("youngmayor.@gmail.com".isEmail, false);
  });

  test("Converts string to cases correctly", () {
    String sentence = "the big brown fox";

    expect(sentence.capitalised, 'The big brown fox');
    expect(sentence.titleCase, 'The Big Brown Fox');
    expect(sentence.snakeCase, 'the_big_brown_fox');
    expect(sentence.kebabCase, 'the-big-brown-fox');
    expect(sentence.camelCase, 'theBigBrownFox');
    expect(sentence.pascalCase, 'TheBigBrownFox');
  });

  test("Converts string with punctuation to cases correctly", () {
    String sentence = "the big brown fox, jumps over the wall!";

    expect(sentence.capitalised, 'The big brown fox, jumps over the wall!');
    expect(sentence.titleCase, 'The Big Brown Fox, Jumps Over The Wall!');
    expect(sentence.snakeCase, 'the_big_brown_fox_jumps_over_the_wall');
    expect(sentence.kebabCase, 'the-big-brown-fox-jumps-over-the-wall');
    expect(sentence.camelCase, 'theBigBrownFoxJumpsOverTheWall');
    expect(sentence.pascalCase, 'TheBigBrownFoxJumpsOverTheWall');
  });

  test("Masks correctly", () {
    expect("youngmayor.dev@gmail.com".mask(), "yo********************om");
    expect("youngmayor.dev@gmail.com".mask(maskLength: 5), "yo*****om");
    expect(
      "youngmayor.dev@gmail.com".mask(maskLength: 5, maskChar: '#'),
      "yo#####om",
    );
    expect(
      "youngmayor.dev@gmail.com".mask(maskLength: 5, start: 5, end: 3),
      "young*****com",
    );
    expect("mayo".mask(maskLength: 5), "mayo");
  });

  test("Reverses string correctly", () {
    expect("hello".reverse(), "olleh");
    expect("world".reverse(), "dlrow");
    expect("12345".reverse(), "54321");
    expect("a".reverse(), "a");
    expect("".reverse(), "");
  });

  test("isBlank and isNotBlank work correctly", () {
    expect("".isBlank, true);
    expect("   ".isBlank, true);
    expect("  \n\t  ".isBlank, true);
    expect("hello".isBlank, false);
    expect("  hello  ".isBlank, false);

    expect("".isNotBlank, false);
    expect("   ".isNotBlank, false);
    expect("hello".isNotBlank, true);
    expect("  hello  ".isNotBlank, true);
  });

  test("removeWhitespace works correctly", () {
    expect("hello world".removeWhitespace(), "helloworld");
    expect("  hello  world  ".removeWhitespace(), "helloworld");
    expect("hello\nworld".removeWhitespace(), "helloworld");
    expect("hello\tworld".removeWhitespace(), "helloworld");
    expect("helloworld".removeWhitespace(), "helloworld");
  });

  test("countOccurrences works correctly", () {
    expect("hello world".countOccurrences('l'), 3);
    expect("hello world".countOccurrences('o'), 2);
    expect("hello world".countOccurrences('x'), 0);
    expect("hello world".countOccurrences('ll'), 1);
    expect("aaa".countOccurrences('aa'), 1);
    expect("hello world".countOccurrences(''), 0);
  });

  test("truncate works correctly", () {
    expect("The quick brown fox".truncate(10), "The quick...");
    expect("Short".truncate(10), "Short");
    expect("Exactly ten".truncate(11), "Exactly ten");
    expect("No spaces here".truncate(8), "No space...");
  });

  test("wrap works correctly", () {
    expect("text".wrap('"'), '"text"');
    expect("text".wrap('[', ']'), '[text]');
    expect("text".wrap('(', ')'), '(text)');
    expect("text".wrap('*'), '*text*');
  });

  test("removePrefix works correctly", () {
    expect("Hello World".removePrefix('Hello '), 'World');
    expect("Hello World".removePrefix('Hi '), 'Hello World');
    expect("test".removePrefix('test'), '');
    expect("test".removePrefix(''), 'test');
  });

  test("removeSuffix works correctly", () {
    expect("Hello World".removeSuffix(' World'), 'Hello');
    expect("Hello World".removeSuffix(' Earth'), 'Hello World');
    expect("test".removeSuffix('test'), '');
    expect("test".removeSuffix(''), 'test');
  });
}
