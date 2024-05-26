import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_status_model.g.dart';

@JsonSerializable()
class TaskStatusModel {
  const TaskStatusModel({
    this.name = '',
    this.value = '',
    this.color,
  });

  final String name;
  final String value;

  @ColorConverter()
  final Color? color;

  factory TaskStatusModel.fromJson(Map<String, dynamic> json) =>
      _$TaskStatusModelFromJson(json);

  factory TaskStatusModel.fromRawJson(String str) =>
      TaskStatusModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => _$TaskStatusModelToJson(this)
    ..removeWhere((key, value) => value == null);
}

class ColorConverter implements JsonConverter<Color?, Color?> {
  const ColorConverter();

  @override
  Color? fromJson(Color? color) {
    return color;
  }

  @override
  Color? toJson(Color? color) {
    return color;
  }
}
