import 'package:task/core/components/FirebaseAuth/auth_status_enum.dart';

class FirebaseResponse {
  final AuthResultStatus status;
  final String response;

  FirebaseResponse({required this.status, required this.response});
}
