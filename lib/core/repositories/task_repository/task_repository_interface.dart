import 'package:cloud_firestore/cloud_firestore.dart';

abstract class TaskInterface {
  Stream<QuerySnapshot>? getTasks({required String status});
  Future<DocumentSnapshot<Map<String, dynamic>>>? getTaskById(
      {required String id});
  Future<bool> createTask(Map<String, dynamic> advertisement);
  Future<bool> updateTask(String path, Map<String, dynamic> data);
  Future<bool> deleteTask(String idAdvertisement);
}
