import 'package:flutter/material.dart';
import 'package:task/data/enums/type_alert_enum.dart';

class SnackBarFloating {
  static void show({
    required BuildContext context,
    required String message,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
    Color? backgroundColor,
    TypeAlertEnum type = TypeAlertEnum.success,
  }) {
    final typeAlert = type.value.copyWith(
      icon: icon,
      label: message,
      color: backgroundColor,
    );

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            typeAlert.icon,
            size: 22,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(child: Text(typeAlert.label)),
        ],
      ),
      backgroundColor: typeAlert.color,
      duration: duration,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
