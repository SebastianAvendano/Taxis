// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:AeroTaxi/core/providers/service_provider.dart';
import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/core/repositories/services_repository/services_repository_impl.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/data/enums/type_alert_enum.dart';
import 'package:AeroTaxi/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class ServiceBottomSheetController {
  final ServicesRepositoryImpl _servicesRepositoryImpl;
  ServiceBottomSheetController(
    this._servicesRepositoryImpl,
  );

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void deleteService(BuildContext context) async {
    isLoading.value = true;

    final service = context.read<ServiceProvider>().selectedService;
    final bool response =
        await _servicesRepositoryImpl.cancelService(service.id!);

    isLoading.value = false;

    if (response) {
      context.router.pop();
      return;
    }
    SnackBarFloating.show(
        context: context,
        message: "Ocurrió un error, intenta nuevamente!",
        type: TypeAlertEnum.error);
  }

  void confirmService(BuildContext context) async {
    isLoading.value = true;

    final service = context.read<ServiceProvider>().selectedService;
    final user = context.read<UserProvider>().user;

    final bool response = await _servicesRepositoryImpl.updateService(
      service.id!,
      service.copyWith(status: "ONGOING", driver: user).toJson(),
    );

    isLoading.value = false;

    if (response) {
      context.router.pop();
      return;
    }
    SnackBarFloating.show(
        context: context,
        message: "Ocurrió un error, intenta nuevamente!",
        type: TypeAlertEnum.error);
  }

  void dispose() {
    isLoading.value = false;
  }
}
