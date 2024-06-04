// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/core/paths/navigator/app_router.dart';
import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/core/repositories/auth_repository/auth_repository_impl.dart';
import 'package:AeroTaxi/data/enums/type_alert_enum.dart';
import 'package:AeroTaxi/data/models/profile_model/user_model.dart';
import 'package:AeroTaxi/data/share/preferences_share.dart';
import 'package:AeroTaxi/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class LoginController {
  final AuthImpl _authImpl;

  LoginController(this._authImpl);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void init(BuildContext context) {}

  Future<void> login(BuildContext context) async {
    try {
      isLoading.value = true;
      final credential = await _authImpl.signInWithGoogle();

      if (credential != null && credential.user != null) {
        final user = credential.user!;

        final userData = UserModel.fromJson({
          'id': user.uid,
          'email': user.email,
          'displayName': user.displayName,
          'photoURL': user.photoURL,
          'rol': "CLIENT"
        });

        final exist = await _authImpl.validateCredentials(user.uid);

        if (exist) {
          onLoginSuccess(context, userData);
        } else {
          final bool response = await _authImpl.createUser(userData.toJson());
          if (response) {
            onLoginSuccess(context, userData);
          } else {
            SnackBarFloating.show(
              context: context,
              message: "Ocurrio un eror inesperado",
              type: TypeAlertEnum.error,
            );
          }
        }

        isLoading.value = false;
      }
    } catch (e) {
      print("Login error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void setUser({required BuildContext context, required UserModel user}) {
    context.read<UserProvider>().user = user;
  }

  onLoginSuccess(BuildContext context, UserModel user) {
    setUser(user: user, context: context);
    PreferencesShare.activeSession = true;
    PreferencesShare.userId = user.id!;
    context.router.replaceAll([const ProfileRoute()]);
  }

  void dispose() {
    isLoading.value = false;
  }
}
