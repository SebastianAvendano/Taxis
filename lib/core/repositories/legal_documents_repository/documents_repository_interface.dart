import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LegalDocumentsInterface {
  Stream<QuerySnapshot>? getDocuments();
}
