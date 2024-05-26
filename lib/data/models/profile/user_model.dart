import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:task/data/models/models_converter/date_time_converter.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    this.createdAt,
    this.displayName = '',
    this.id = '',
    this.photo = '',
    this.email = '',
    this.fcmToken = '',
    this.cellPhone = '',
    this.isActive = false,
  });

  final String? displayName;
  final String? email;
  final String? id;
  final bool? isActive;
  final String? photo;
  final String? fcmToken;
  final String? cellPhone;

  @DateTimeConverter()
  final DateTime? createdAt;

  UserModel copyWith({
    String? displayName,
    String? id,
    String? email,
    String? photo,
    bool? isActive,
    String? fcmToken,
    String? cellPhone,
    DateTime? createdAt,
  }) =>
      UserModel(
        displayName: displayName ?? this.displayName,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        fcmToken: fcmToken ?? this.fcmToken,
        isActive: isActive ?? this.isActive,
        cellPhone: cellPhone ?? this.cellPhone,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
