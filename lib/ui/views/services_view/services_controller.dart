// ignore_for_file: use_build_context_synchronously

import 'package:AeroTaxi/core/providers/service_provider.dart';
import 'package:AeroTaxi/core/repositories/services_repository/services_repository_impl.dart';
import 'package:AeroTaxi/data/models/service_model/service_model.dart';
import 'package:AeroTaxi/ui/views/service_buttom_sheet/service_buttom_sheet.dart';
import 'package:AeroTaxi/ui/views/services_view/services_store.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:AeroTaxi/core/paths/navigator/app_router.dart';
import 'package:provider/provider.dart';

@singleton
class ServicesController {
  final ServicesRepositoryImpl _repositoryImpl;

  ServicesController(this._repositoryImpl);

  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<Stream<QuerySnapshot>?> taskStreamNotifier =
      ValueNotifier<Stream<QuerySnapshot>?>(null);

  Future<void> initView({required BuildContext context}) async {
    getServices(context: context);
  }

  int activeIndexTab = 0;

  redirectToForm({required BuildContext context}) {
    context.router.push(const CreateTaskRoute());
  }

  void getServices({required BuildContext context}) {
    final String status = ServiceStore.tabsStatus[activeIndexTab].value;
    final stream = _repositoryImpl.getServices(status: status);
    taskStreamNotifier.value = stream;
  }

  void onTabChanged(int indexTab, BuildContext context) {
    if (activeIndexTab != indexTab) {
      activeIndexTab = indexTab;
      getServices(context: context);
    }
  }

  void onSelectedTask(BuildContext context, ServiceModel service) {
    context.read<ServiceProvider>().selectedService = service;
    _showBottomSheet(context, const ServiceBottomSheet());
  }

  _showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.5,
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
    isLoading.value = false;
    taskStreamNotifier.value = null;
  }
}
