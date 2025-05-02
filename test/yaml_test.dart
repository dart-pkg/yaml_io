import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:yaml_io/yaml_io.dart';

main() {
  group('YamlTests', () {
    test('yaml_io(1)', () {
      final yaml = toYaml({
        'name': 'Joe',
        'null_data': null,
        'ids': [10, 20, 30, null],
        'desc': 'This is\na multiline\ntext',
        'enabled': true,
      });
      echo(yaml);
      expect(
        yaml ==
            '''
name: Joe
null_data:
ids:
  - 10
  - 20
  - 30
  - null
desc: |-
  This is
  a multiline
  text
enabled: true
''',
        isTrue,
      );
      dynamic obj = fromYaml(yaml);
      echo(obj['ids'][1], r"obj['ids'][1]");
      expect(obj['ids'][1] == 20, isTrue);
      echo(toYaml(null), r'toYaml(null)');
      echo(toYaml(123), r'toYaml(123)');
      echo(toYaml('A string'), 'toYaml(\'A string\')');
      echo(toYaml('A multiline\nstring'));
    });
  });
}
