import 'package:AeroTaxi/data/models/legalDocument_model/document_model.dart';
import 'package:AeroTaxi/ui/views/legal_document_view/legal_document_controller.dart';
import 'package:AeroTaxi/ui/widgets/card_options_help.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:jiffy/jiffy.dart';

final injector = GetIt.instance;

class ListDocuments extends StatelessWidget {
  const ListDocuments({super.key, required this.listDocuments});

  final List<QueryDocumentSnapshot?> listDocuments;
  static final LegalDocumentsController _controller =
      injector.get<LegalDocumentsController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listDocuments.length,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      separatorBuilder: (BuildContext context, int index) =>
          const Padding(padding: EdgeInsets.all(10.0), child: Divider()),
      itemBuilder: (BuildContext context, int index) {
        final DocumentModel doc = DocumentModel.fromJson(
            listDocuments[index]?.data()! as Map<String, dynamic>);
        return CardOptionHelp(
          icon: Feather.file,
          date: Jiffy(doc.createdAt).format("dd MMMM yyyy"),
          title: doc.title!,
          description: doc.description!,
          onTap: () => _controller.onSelectedDoocument(context, doc),
        );
      },
    );
  }
}
