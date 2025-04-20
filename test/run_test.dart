import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:yaml_io/yaml_io.dart';

void main() {
  group('Run', () {
    test('run1', () {
      final yaml = toYaml({
        'name': 'Joe',
        'ids': [10, 20, 30],
        'desc': 'This is\na multiline\ntext',
        'enabled': true,
      });
      echo(yaml);
      echo(fromYaml(yaml));
    });
  });
}
