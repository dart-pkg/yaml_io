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
  String yaml1 = yamlDoc.toString();
  String yaml2 = YamlMagic.fromString(content: yaml1, path: 'yaml1').toString();
  if (yaml2.endsWith('\n\n')) {
    yaml2 = yaml2.substring(0, yaml2.length - 1);
  }
  return yaml2 == '' ? yaml1 : yaml2;
}
