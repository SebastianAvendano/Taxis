// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:task/core/paths/navigator/app_router.dart';
import 'package:task/core/providers/task_provicer.dart';
import 'package:task/core/repositories/task_repository/task_repository_impl.dart';
import 'package:task/data/models/task/task_model.dart';
import 'package:task/ui/views/task_buttom_sheet/task_buttom_sheet.dart';
import 'package:task/ui/views/tasks_view/task_store.dart';

@singleton
class TaskController {
  final TaskImpl _taskImpl;

  TaskController(this._taskImpl);

  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<Stream<QuerySnapshot>?> taskStreamNotifier =
      ValueNotifier<Stream<QuerySnapshot>?>(null);

  Future<void> initView({required BuildContext context}) async {
    getListTasks(context: context);
  }

  int activeIndexTab = 0;

  redirectToForm({required BuildContext context}) {
    context.router.push(const CreateTaskRoute());
  }

  void getListTasks({required BuildContext context}) {
    final String status = TaskStore.tabsStatus[activeIndexTab].value;
    final stream = _taskImpl.getTasks(status: status);
    taskStreamNotifier.value = stream;
  }

  void onTabChanged(int indexTab, BuildContext context) {
    if (activeIndexTab != indexTab) {
      activeIndexTab = indexTab;
      getListTasks(context: context);
    }
  }

  void onSelectedTask(BuildContext context, TaskModel task) {
    context.read<TaskProvider>().selectedTask = task;
    _showBottomSheet(context, const TaskButtomSheet());
  }

  _showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (_) => widget,
    );
  }

  void dispose() {
    isLoading.value = false;
    taskStreamNotifier.value = null;
  }
}
