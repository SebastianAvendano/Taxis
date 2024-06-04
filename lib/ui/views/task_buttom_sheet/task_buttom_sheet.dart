import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/core/providers/task_provicer.dart';
import 'package:AeroTaxi/ui/views/task_buttom_sheet/task_buttom_sheet_controller.dart';
import 'package:AeroTaxi/ui/widgets/header_bottom_sheet.dart';
import 'package:AeroTaxi/data/models/task_model/task_model.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:AeroTaxi/ui/widgets/button.dart';

final injector = GetIt.instance;

class TaskButtomSheet extends StatefulWidget {
  const TaskButtomSheet({super.key});

  @override
  State<TaskButtomSheet> createState() => _TaskButtomSheetState();
}

class _TaskButtomSheetState extends State<TaskButtomSheet> {
  final _controller = injector.get<TaskButtomSheetController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final TaskModel selectedTask = taskProvider.selectedTask;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderBottomSheet(title: ""),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 15, 15, 0),
                      child: _buildContent(selectedTask),
                    ),
                    ButtonWidget(
                      margin: const EdgeInsets.only(bottom: 30),
                      label: "Eliminar",
                      backgroundColor: ColorsAppTheme.orangeColor,
                      spacing: const SizedBox(width: 20),
                      onTap: () => _controller.deleteTask(context),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(TaskModel selectedTask) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedTask.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          selectedTask.description!,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
