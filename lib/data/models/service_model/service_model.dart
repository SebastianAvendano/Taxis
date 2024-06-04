import 'dart:convert';

import 'package:AeroTaxi/data/models/profile_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:AeroTaxi/data/models/models_converter/date_time_converter.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  const ServiceModel({
    this.createdAt,
    this.endDate,
    this.title = '',
    this.id = '',
    this.driver = const UserModel(),
    this.lat = '',
    this.client = const UserModel(),
    this.long = '',
    this.origin = '',
    this.destination = '',
    this.status = '',
    this.userId = '',
    this.isActive = false,
    this.value = 0,
  });

  final String? title;
  final String? lat;
  final String? userId;
  final String? id;
  final bool? isActive;
  final String? long;
  final String? origin;
  final String? destination;
  final String? status;
  final double? value;

  @JsonKey(toJson: _toJsonObject)
  final UserModel? client;

  @JsonKey(toJson: _toJsonObject)
  final UserModel? driver;

  @DateTimeConverter()
  final DateTime? createdAt;

  @DateTimeConverter()
  final DateTime? endDate;

  ServiceModel copyWith({
    String? title,
    String? id,
    String? lat,
    UserModel? driver,
    bool? isActive,
    String? long,
    UserModel? client,
    String? origin,
    String? status,
    String? userId,
    String? destination,
    DateTime? createdAt,
    DateTime? endDate,
    double? value,
  }) =>
      ServiceModel(
        title: title ?? this.title,
        driver: driver ?? this.driver,
        lat: lat ?? this.lat,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        endDate: endDate ?? this.endDate,
        id: id ?? this.id,
        long: long ?? this.long,
        client: client ?? this.client,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        value: value ?? this.value,
        status: status ?? this.status,
        userId: userId ?? this.userId,
      );

  factory ServiceModel.fromRawJson(String str) =>
      ServiceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static Map<String, dynamic> _toJsonObject(dynamic object) {
    return object.toJson();
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
