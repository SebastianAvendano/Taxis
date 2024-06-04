import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ServicesRepositoryInterface {
  Stream<QuerySnapshot>? getServices({required String status});
  Future<DocumentSnapshot<Map<String, dynamic>>>? getServiceById(
      {required String id});
  Future<bool> createService(Map<String, dynamic> advertisement);
  Future<bool> updateService(String path, Map<String, dynamic> data);
  Future<bool> cancelService(String idAdvertisement);
}
