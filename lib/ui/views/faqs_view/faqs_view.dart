import 'package:AeroTaxi/ui/widgets/empty_data_lottie_widget.dart';
import 'package:AeroTaxi/ui/widgets/loading_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';

import 'faqs_controller.dart';
import 'faqs_widgets/list_faqs_widget.dart';

final injector = GetIt.instance;

@RoutePage()
class FaqsView extends StatefulWidget {
  const FaqsView({super.key});

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  late FaqsController controller;

  final FaqsController _controller =
      injector.get<FaqsController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preguntas frecuentes"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _controller.getListDocuments(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingWidget();
          }

          final List<QueryDocumentSnapshot?> faqs =
              snapshot.data?.docs ?? [];

          if (faqs.isEmpty) {
            return _buildEmpyData(context);
          } else {
            return ListFaqsWidget(listDocuments: faqs);
          }
        },
      ),
    );
  }

  Widget _buildEmpyData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: const EmptyDataLottie(
          path: 'assets/lottie/empty_list_lottie.json',
          label: "No hay preguntas para mostrar",
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      children: List.generate(
        5,
        (index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: LoadingWidget(
            height: 80,
          ),
        ),
      ),
    );
  }
}
