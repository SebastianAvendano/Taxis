import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<UserCredential?> signInWithGoogle();
  Future<bool> createUser(Map<String, dynamic> userData);
  Future<void> signOut();
  User? getCurrentUser();
  Future<bool> validateCredentials(String id);
  Future<DocumentSnapshot<Map<String, dynamic>>>? getUseryId(
      {required String id});
}
