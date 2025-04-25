import 'package:test/test.dart';
import 'package:yaml_io/yaml_io.dart';

void main() {
  group('YamlTests', () {
    test('yaml_io(1)', () {
      final yaml = toYaml({
        'name': 'Joe',
        'ids': [10, 20, 30],
        'desc': 'This is\na multiline\ntext',
        'enabled': true,
      });
      print('```$yaml```');
      dynamic obj = fromYaml(yaml);
      print(obj['ids'][1]);
      expect(obj['ids'][1] == 20, isTrue);
    });
  });
}
