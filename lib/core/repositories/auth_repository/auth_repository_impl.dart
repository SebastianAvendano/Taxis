import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_repository_interface.dart';

@injectable
class AuthImpl implements AuthInterface {
  final Logger _logger;
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthImpl(
    this._auth,
    this._logger,
    this._firestore,
  );

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static const String _keyCollection = 'users';

  @override
  Future<bool> createUser(Map<String, dynamic> userData) async {
    try {
      await _firestore
          .collection(_keyCollection)
          .doc(userData['id'])
          .set(userData);
      return true;
    } on FirebaseException catch (e) {
      _logger.e(e.message);
      return false;
    }
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      await signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      _logger.e("signInWithGoogle $e");
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
