import 'package:AeroTaxi/ui/widgets/empty_data_lottie_widget.dart';
import 'package:AeroTaxi/ui/widgets/loading_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';

import 'legal_document_controller.dart';
import 'legal_document_widgets/list_legal_doument.dart';

final injector = GetIt.instance;

@RoutePage()
class LegalDocumentView extends StatefulWidget {
  const LegalDocumentView({super.key});

  @override
  State<LegalDocumentView> createState() => _LegalDocumentViewState();
}

class _LegalDocumentViewState extends State<LegalDocumentView> {
  late LegalDocumentsController controller;

  final LegalDocumentsController _controller =
      injector.get<LegalDocumentsController>();

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
        title: const Text("Documentos legales"),
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

          final List<QueryDocumentSnapshot?> listDocuments =
              snapshot.data?.docs ?? [];

          if (listDocuments.isEmpty) {
            return _buildEmpyData(context);
          } else {
            return ListDocuments(listDocuments: listDocuments);
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
          label: "No hay documentos para mostrar",
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
