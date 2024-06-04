import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:AeroTaxi/data/models/models_converter/date_time_converter.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  const TaskModel({
    this.createdAt,
    this.endDate,
    this.title = '',
    this.id = '',
    this.photo = '',
    this.description = '',
    this.userId = '',
    this.status = '',
    this.isActive = false,
  });

  final String? title;
  final String? description;
  final String? id;
  final bool? isActive;
  final String? photo;
  final String? status;
  final String? userId;

  @DateTimeConverter()
  final DateTime? createdAt;

  @DateTimeConverter()
  final DateTime? endDate;

  TaskModel copyWith({
    String? title,
    String? id,
    String? description,
    String? photo,
    bool? isActive,
    String? status,
    String? userId,
    DateTime? createdAt,
    DateTime? endDate,
  }) =>
      TaskModel(
        title: title ?? this.title,
        photo: photo ?? this.photo,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        endDate: endDate ?? this.endDate,
        id: id ?? this.id,
        status: status ?? this.status,
        userId: userId ?? this.userId,
      );

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
