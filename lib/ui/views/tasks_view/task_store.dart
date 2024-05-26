import 'package:task/data/models/task/task_status_model.dart';

class TaskStore {
  static const List<TaskStatusModel> tabsStatus = [
    TaskStatusModel(
      value: "PENDING",
      name: "Pendientes",
    ),
    TaskStatusModel(
      value: "DONE",
      name: "Finalizadas",
    ),
  ];
}
