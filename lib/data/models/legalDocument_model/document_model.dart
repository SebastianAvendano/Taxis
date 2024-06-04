import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:AeroTaxi/data/models/models_converter/date_time_converter.dart';

part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
  const DocumentModel({
    this.createdAt,
    this.title = '',
    this.id = '',
    this.description = '',
    this.type = '',
    this.isActive = false,
  });

  final String? title;
  final String? type;
  final String? id;
  final bool? isActive;
  final String? description;

  @DateTimeConverter()
  final DateTime? createdAt;

  DocumentModel copyWith({
    String? title,
    String? id,
    String? type,
    String? description,
    bool? isActive,
    DateTime? createdAt,
  }) =>
      DocumentModel(
        title: title ?? this.title,
        description: description ?? this.description,
        type: type ?? this.type,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory DocumentModel.fromRawJson(String str) =>
      DocumentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);
}
