import 'dart:core';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';
import 'dart:convert' as convert;

/// Converts a yaml string to a dart dynamic
dynamic fromYaml(String $yaml) {
  var $doc = loadYaml($yaml);
  return convert.json.decode((convert.json.encode($doc)));
}

/// Converts a dart dynamic to a yaml string
String toYaml(dynamic $x) {
  final $yamlWriter = YamlWriter(allowUnquotedStrings: true);
  final $yamlDoc = $yamlWriter.write($x);
  return $yamlDoc.toString();
}
