import 'package:AeroTaxi/data/models/task_model/task_status_model.dart';

class ServiceStore {
  static const List<TaskStatusModel> tabsStatus = [
    TaskStatusModel(
      value: "PENDING",
      name: "Pendientes",
    ),
    TaskStatusModel(
      value: "ONGOING",
      name: "En curso",
    ),
    TaskStatusModel(
      value: "CANCELLED",
      name: "Cancelados",
    ),
    TaskStatusModel(
      value: "DONE",
      name: "Finalizadas",
    ),
  ];
}
