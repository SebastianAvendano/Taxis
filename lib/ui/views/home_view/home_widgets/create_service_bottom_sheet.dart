import 'package:AeroTaxi/ui/views/home_view/home_controller.dart';
import 'package:AeroTaxi/ui/widgets/activity_indicator%20copy.dart';
import 'package:AeroTaxi/ui/widgets/text_form_input.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:AeroTaxi/ui/widgets/header_bottom_sheet.dart';
import 'package:AeroTaxi/ui/widgets/button.dart';

final injector = GetIt.instance;

class CreateServiceBottomSheet extends StatefulWidget {
  const CreateServiceBottomSheet({super.key});

  @override
  State<CreateServiceBottomSheet> createState() =>
      _CreateServiceBottomSheetState();
}

class _CreateServiceBottomSheetState extends State<CreateServiceBottomSheet> {
  final _controller = injector.get<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderBottomSheet(title: ""),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: _buildContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
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
      hintText: 'Origen',
      maxLines: 1,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Debe ingresar el origen';
        }
        return null;
      },
    );
  }

  Widget _buildDescription() {
    return TextFormInput(
      controller: _controller.descriptionController,
      hintText: 'Destino',
      maxLines: 1,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'El destino es obligatorio';
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
          onTap: () => _controller.createService(context),
          label: 'Crear',
        ),
      ),
    );
  }
}
