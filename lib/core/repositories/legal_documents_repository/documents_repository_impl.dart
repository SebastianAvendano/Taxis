import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'documents_repository_interface.dart';

@injectable
class LegalDocumentsImpl implements LegalDocumentsInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;
  final String _keyCollection = 'LegalDocuments';

  LegalDocumentsImpl(this._logger, this._firestore);

  @override
  Stream<QuerySnapshot<Object?>>? getDocuments() {
    try {
      return _firestore
          .collection(_keyCollection)
          .where("isActive", isEqualTo: true)
          .orderBy("createdAt", descending: true)
          .snapshots();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }
}
