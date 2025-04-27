import 'dart:core';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'package:yaml_magic/yaml_magic.dart';
import 'dart:convert' as convert;

/// Converts a yaml string to a dart dynamic
dynamic fromYaml(String yaml) {
  var doc = loadYaml(yaml);
  return convert.json.decode((convert.json.encode(doc)));
}

/// Converts a dart dynamic to a yaml string
String toYaml(dynamic x) {
  final yamlWriter = YamlWriter(allowUnquotedStrings: true);
  final yamlDoc = yamlWriter.write(x);
  // return yamlDoc.toString();
  String yaml = yamlDoc.toString();
  yaml = YamlMagic.fromString(content: yaml, path: 'temp.yaml').toString();
  if (yaml.endsWith('\n\n')) {
    yaml = yaml.substring(0, yaml.length - 1);
  }
  return yaml;
}
