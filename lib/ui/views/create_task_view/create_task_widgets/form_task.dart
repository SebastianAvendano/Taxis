import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/ui/views/create_task_view/create_task_controller.dart';
import 'package:AeroTaxi/ui/widgets/activity_indicator%20copy.dart';
import 'package:AeroTaxi/ui/widgets/button.dart';
import 'package:AeroTaxi/ui/widgets/text_form_input.dart';

final injector = GetIt.instance;

class FormTask extends StatefulWidget {
  const FormTask({super.key});

  @override
  State<FormTask> createState() => _FormTaskState();
}

class _FormTaskState extends State<FormTask> {
  final _controller = injector.get<CreateTaskController>();

  @override
  void initState() {
    _controller.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _controller.formKey,
      child: Column(
        children: [
          _buildTitle(),
          _buildSpacing(),
          _buildDescription(),
          _buildSpacing(),
          _buildButton(context),
        ],
      ),
    );
  }

  Widget _buildSpacing() {
    return const SizedBox(height: 30);
  }

  Widget _buildTitle() {
    return TextFormInput(
      controller: _controller.titleController,
      hintText: 'Asunto',
      maxLines: 2,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Debe ingresar el nombre';
        }
        return null;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormInput(
      controller: _controller.descriptionController,
      hintText: 'Descripción',
      maxLines: 5,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'La descripciœn es obligatoria';
        }
        return null;
      },
    );
  }

  Widget _buildButton(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _controller.isLoading,
      builder: (BuildContext _, bool isLoading, Widget? child) {
        return isLoading ? const ActivityIndicator() : child!;
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ButtonWidget(
          onTap: () => _controller.createTask(context),
          label: 'Guardar',
        ),
      ),
    );
  }
}
