import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/core/repositories/task_repository/task_repository_interface.dart';
import 'package:task/data/share/preferences_share.dart';

@injectable
class TaskImpl implements TaskInterface {
  final Logger _logger;
  final FirebaseFirestore _firestore;
  final String _keyCollection = 'tasks';

  TaskImpl(this._logger, this._firestore);

  @override
  Future<bool> createTask(Map<String, dynamic> task) async {
    try {
      DocumentReference docRef = _firestore.collection(_keyCollection).doc();
      task['id'] = docRef.id;
      await docRef.set(task);
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Object?>>? getTasks({required String status}) {
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
  Future<DocumentSnapshot<Map<String, dynamic>>>? getTaskById(
      {required String id}) {
    try {
      return _firestore.collection(_keyCollection).doc(id).get();
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return null;
    }
  }

  @override
  Future<bool> deleteTask(String path) async {
    try {
      await _firestore
          .collection(_keyCollection)
          .doc(path)
          .update({"isActive": false});
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<bool> updateTask(String path, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(_keyCollection).doc(path).update(data);
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }
}
