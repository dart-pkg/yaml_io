import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:yaml_io/yaml_io.dart';

main() {
  group('YamlTests', () {
    test('yaml_io(1)', () {
      final yaml = toYaml({
        'name': 'Joe',
        'null_data': null,
        'ids': [10, 20, 30],
        'desc': 'This is\na multiline\ntext',
        'enabled': true,
      });
      echo(yaml);
      dynamic obj = fromYaml(yaml);
      echo(obj['ids'][1], r"obj['ids'][1]");
      expect(obj['ids'][1] == 20, isTrue);
    });
  });
}
