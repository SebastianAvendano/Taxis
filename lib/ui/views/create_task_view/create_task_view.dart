import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'create_task_controller.dart';
import 'create_task_widgets/form_task.dart';

final injector = GetIt.instance;

@RoutePage()
class CreateTaskView extends StatefulWidget {
  const CreateTaskView({
    super.key,
  });

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final _controller = injector.get<CreateTaskController>();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear nueva tarea"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 40, 15, (paddingBottom + 15)),
        child: const FormTask(),
      ),
    );
  }
}
