import 'package:AeroTaxi/core/repositories/services_repository/services_repository_interface.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:AeroTaxi/data/share/preferences_share.dart';

@injectable
class ServicesRepositoryImpl implements ServicesRepositoryInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;
  final String _keyCollection = 'services';

  ServicesRepositoryImpl(this._logger, this._firestore);

  @override
  Future<bool> createService(Map<String, dynamic> task) async {
    try {
      DocumentReference docRef = _firestore.collection(_keyCollection).doc();
      task['id'] = docRef.id;
      task['status'] = "PENDING";
      task['userId'] = PreferencesShare.userId;
      await docRef.set(task);
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>>? getServices({required String status}) {
    try {
      return _firestore
          .collection(_keyCollection)
          .where("isActive", isEqualTo: true)
          .where("status", isEqualTo: status)
          .where("userId", isEqualTo: PreferencesShare.userId)
          .orderBy("createdAt", descending: true)
          .snapshots();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>>? getServiceById(
      {required String id}) {
    try {
      return _firestore.collection(_keyCollection).doc(id).get();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<bool> cancelService(String path) async {
    try {
      await _firestore
          .collection(_keyCollection)
          .doc(path)
          .update({"status": "CANCELLED", "value": 0});
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<bool> updateService(String path, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(_keyCollection).doc(path).update(data);
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }
}
