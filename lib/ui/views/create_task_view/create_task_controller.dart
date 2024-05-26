// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:task/core/repositories/task_repository/task_repository_impl.dart';
import 'package:task/data/enums/type_alert_enum.dart';
import 'package:task/data/models/task/task_model.dart';
import 'package:task/data/share/preferences_share.dart';
import 'package:task/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class CreateTaskController {
  final TaskImpl _taskImpl;
  CreateTaskController(
    this._taskImpl,
  );

  late TextEditingController titleController;
  late TextEditingController descriptionController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  init(BuildContext context) {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  void createTask(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final TaskModel newTask = TaskModel(
          createdAt: DateTime.now(),
          userId: PreferencesShare.userId,
          isActive: true,
          title: titleController.text,
          description: descriptionController.text,
          status: "PENDING");

      final bool response = await _taskImpl.createTask(newTask.toJson());

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
  }

  void dispose() {
    isLoading.value = false;
    descriptionController.dispose();
    titleController.dispose();
  }
}
