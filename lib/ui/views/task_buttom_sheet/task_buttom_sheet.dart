import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:task/core/providers/task_provicer.dart';
import 'package:task/ui/views/task_buttom_sheet/task_buttom_sheet_controller.dart';
import 'package:task/ui/views/task_buttom_sheet/task_buttom_sheet_widgets/header_bottom_sheet.dart';
import 'package:task/data/models/task/task_model.dart';
import 'package:task/core/theme/colors_theme.dart';
import 'package:task/ui/widgets/activity_indicator%20copy.dart';
import 'package:task/ui/widgets/button.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<TaskProvider>(
          builder: (context, taskProvider, child) {
            final TaskModel selectedTask = taskProvider.selectedTask;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const HeaderBottomSheet(title: ""),
                Padding(
                  
                  padding: const EdgeInsets.fromLTRB(40, 15, 15, 0),
                  child: _buildContent(selectedTask),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: _buildOptions(),
    );
  }

  Widget _buildContent(TaskModel selectedTask) {
    return Expanded(
      child: Column(
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
      ),
    );
  }

  Widget _buildOptions() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 15, 30),
      child: ValueListenableBuilder(
        valueListenable: _controller.isLoading,
        builder: (context, isLoading, child) => isLoading
            ? const ActivityIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      label: "Eliminar",
                      backgroundColor: ColorsAppTheme.orangeColor,
                      spacing: const SizedBox(width: 20),
                      onTap: () => _controller.deleteTask(context),
                    ),
                  ),
                  const SizedBox(width: 15),
                  _buildDoneButton(),
                ],
              ),
      ),
    );
  }

  Widget _buildDoneButton() {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      final TaskModel selectedTask = taskProvider.selectedTask;

      return selectedTask.status == "PENDING"
          ? Expanded(
              child: ButtonWidget(
                label: "Finalizar",
                backgroundColor: ColorsAppTheme.primaryColor,
                spacing: const SizedBox(width: 20),
                onTap: () => _controller.updateTask(context),
              ),
            )
          : const SizedBox();
    });
  }
}
