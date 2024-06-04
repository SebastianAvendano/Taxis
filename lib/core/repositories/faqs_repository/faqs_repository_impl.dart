import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'faqs_repository_interface.dart';

@injectable
class FaqsRepositoryImpl implements FaqsRepositoryInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;
  final String _keyCollection = 'faqs';

  FaqsRepositoryImpl(this._logger, this._firestore);

  @override
  Stream<QuerySnapshot<Object?>>? getFaqs() {
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
