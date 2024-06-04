// ignore_for_file: use_build_context_synchronously

import 'package:AeroTaxi/core/repositories/legal_documents_repository/documents_repository_impl.dart';
import 'package:AeroTaxi/data/models/legalDocument_model/document_model.dart';
import 'package:AeroTaxi/ui/widgets/header_bottom_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:AeroTaxi/core/paths/navigator/app_router.dart';

@singleton
class LegalDocumentsController {
  final LegalDocumentsImpl _documentsImpl;

  LegalDocumentsController(this._documentsImpl);

  final ValueNotifier<bool> isLoading = ValueNotifier(true);

  Future<void> initView({required BuildContext context}) async {}

  redirectToForm({required BuildContext context}) {
    context.router.push(const CreateTaskRoute());
  }

  Stream<QuerySnapshot>? getListDocuments() {
    return _documentsImpl.getDocuments();
  }

  void onSelectedDoocument(
    BuildContext context,
    DocumentModel selectedDocument,
  ) {
    _showBottomSheet(
      context,
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderBottomSheet(title: ""),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    selectedDocument.title!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    selectedDocument.description!,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
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
  }
}
