import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthInterface {
  Future<UserCredential?> signInWithGoogle();
  Future<bool> createUser(Map<String, dynamic> userData);
  Future<void> signOut();
  User? getCurrentUser();
}
