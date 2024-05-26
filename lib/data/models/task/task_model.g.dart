// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as Timestamp?),
      endDate:
          const DateTimeConverter().fromJson(json['endDate'] as Timestamp?),
      title: json['title'] as String? ?? '',
      id: json['id'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      description: json['description'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      status: json['status'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'isActive': instance.isActive,
      'photo': instance.photo,
      'status': instance.status,
      'userId': instance.userId,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'endDate': const DateTimeConverter().toJson(instance.endDate),
    };
