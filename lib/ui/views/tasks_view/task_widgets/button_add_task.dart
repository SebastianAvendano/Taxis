import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/core/theme/colors_theme.dart';
import 'package:AeroTaxi/ui/views/tasks_view/task_controller.dart';

final injector = GetIt.instance;

class ButtonAddTask extends StatelessWidget {
  const ButtonAddTask({
    super.key,
  });

  static final controller = injector.get<TaskController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => controller.redirectToForm(context: context),
      backgroundColor: ColorsAppTheme.primaryColor,
      child: Container(
        height: 50,
        width: 60,
        decoration: const BoxDecoration(
          color: ColorsAppTheme.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Icon(
          MaterialCommunityIcons.plus,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
