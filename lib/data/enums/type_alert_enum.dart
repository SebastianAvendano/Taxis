import 'package:flutter/material.dart';
import 'package:task/core/theme/colors_theme.dart';
import 'package:task/data/models/type_alert_model.dart';

enum TypeAlertEnum {
  success(TypeAlertGenericModel(
    color: ColorsAppTheme.greenColor,
    icon: Icons.check_circle,
  )),
  error(TypeAlertGenericModel(
    icon: Icons.error,
    color: ColorsAppTheme.orangeColor,
  )),
  information(TypeAlertGenericModel(
    icon: Icons.error_outline,
    color: ColorsAppTheme.blueColor,
  ));

  const TypeAlertEnum(this.value);
  final TypeAlertGenericModel value;
}
