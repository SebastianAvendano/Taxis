// ignore_for_file: use_build_context_synchronously

import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/core/repositories/services_repository/services_repository_impl.dart';
import 'package:AeroTaxi/data/enums/type_alert_enum.dart';
import 'package:AeroTaxi/data/models/profile_model/user_model.dart';
import 'package:AeroTaxi/data/models/service_model/service_model.dart';
import 'package:AeroTaxi/ui/views/home_view/home_widgets/create_service_bottom_sheet.dart';
import 'package:AeroTaxi/ui/views/profile_view/profile_controller.dart';
import 'package:AeroTaxi/ui/widgets/snack_bar_alert_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:AeroTaxi/core/paths/navigator/app_router.dart';
import 'package:provider/provider.dart';

@singleton
class HomeController {
  final ServicesRepositoryImpl _repositoryImpl;
  final ProfileController _profileController;

  HomeController(this._repositoryImpl, this._profileController);

  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> initView({required BuildContext context}) async {
    _profileController.initView(context: context);
    getListService(context: context);
  }

  int activeIndexTab = 0;

  redirectToForm({required BuildContext context}) {
    context.router.push(const CreateTaskRoute());
  }

  Stream<QuerySnapshot>? getListService({required BuildContext context}) =>
      _repositoryImpl.getServices(status: "PENDING");

  void onNewService(BuildContext context) {
    _showBottomSheet(context, const CreateServiceBottomSheet());
  }

  Future<void> createService(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      final user = context.read<UserProvider>().user;
      final data = ServiceModel(
        createdAt: DateTime.now(),
        driver: const UserModel(),
        isActive: true,
        value: 1500,
        client: user,
        lat: "2.8364366",
        long: "-75.2899375",
        origin: titleController.text,
        destination: descriptionController.text,
      );

      final bool response = await _repositoryImpl.createService(data.toJson());

      isLoading.value = false;

      if (response) {
        context.router.pop();
        return;
      }
      SnackBarFloating.show(
        context: context,
        message: "Ocurrió un error, intenta nuevamente!",
        type: TypeAlertEnum.error,
      );
    }
  }

  _showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
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
    titleController.dispose();
    descriptionController.dispose();
    isLoading.value = false;
  }
}
