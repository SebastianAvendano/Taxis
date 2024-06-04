// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/core/providers/task_provicer.dart';
import 'package:AeroTaxi/core/repositories/task_repository/task_repository_impl.dart';
import 'package:AeroTaxi/data/enums/type_alert_enum.dart';
import 'package:AeroTaxi/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class TaskButtomSheetController {
  final TaskImpl _taskImpl;
  TaskButtomSheetController(
    this._taskImpl,
  );

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void deleteTask(BuildContext context) async {
    isLoading.value = true;

    final currentTask = context.read<TaskProvider>().selectedTask;
    final bool response = await _taskImpl.deleteTask(currentTask.id!);

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

  void updateTask(BuildContext context) async {
    isLoading.value = true;

    final currentTask = context.read<TaskProvider>().selectedTask;
    final bool response = await _taskImpl.updateTask(
        currentTask.id!, currentTask.copyWith(status: "DONE").toJson());

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
