// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskStatusModel _$TaskStatusModelFromJson(Map<String, dynamic> json) =>
    TaskStatusModel(
      name: json['name'] as String? ?? '',
      value: json['value'] as String? ?? '',
      color: const ColorConverter().fromJson(json['color'] as Color?),
    );

Map<String, dynamic> _$TaskStatusModelToJson(TaskStatusModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'color': const ColorConverter().toJson(instance.color),
    };
