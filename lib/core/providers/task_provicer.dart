import 'package:AeroTaxi/data/models/task_model/task_model.dart';

import 'disposable_provider.dart';

class TaskProvider extends DisposableProvider {
  TaskModel _selectedTask = const TaskModel();

  TaskModel get selectedTask => _selectedTask;

  set selectedTask(TaskModel selectedTask) {
    _selectedTask = selectedTask;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _selectedTask = const TaskModel();
  }
}
