import 'package:flutter_test/flutter_test.dart';
import 'package:mayr_extensions/mayr_extensions.dart';

void main() {
  test("let transforms object correctly", () {
    final result = 'hello'.let((it) => it.toString().toUpperCase());
    expect(result, 'HELLO');

    final length = 'test'.let((it) => it.toString().length);
    expect(length, 4);

    final doubled = 5.let((it) => (it as int) * 2);
    expect(doubled, 10);
  });

  test("also executes action and returns object", () {
    final executed = <String>[];

    final result = 'test'.also((it) {
      executed.add('executed');
    });

    expect(result, 'test');
    expect(executed, ['executed']);
  });

  test("also can chain multiple actions", () {
    final log = <String>[];

    final result = 'value'
        .also((it) => log.add('first'))
        .also((it) => log.add('second'))
        .also((it) => log.add('third'));

    expect(result, 'value');
    expect(log, ['first', 'second', 'third']);
  });
}
