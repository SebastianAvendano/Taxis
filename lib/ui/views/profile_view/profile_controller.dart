// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:AeroTaxi/core/components/launch_url_component.dart';
import 'package:AeroTaxi/core/paths/navigator/app_router.dart';
import 'package:AeroTaxi/core/providers/providers.dart';
import 'package:AeroTaxi/core/providers/user_provider.dart';
import 'package:AeroTaxi/core/repositories/auth_repository/auth_repository_impl.dart';
import 'package:AeroTaxi/data/models/profile_model/user_model.dart';
import 'package:AeroTaxi/data/share/preferences_share.dart';

@singleton
class ProfileController {
  final AuthImpl _authImpl;
  ProfileController(this._authImpl);

  Future<void> initView({required BuildContext context}) async {
    final userData = _authImpl.getCurrentUser()!;
    final queryUser = await _authImpl.getUseryId(id: userData.uid);
    final user = queryUser!.data()!;
    setUser(
      user: UserModel.fromJson({
        'id': userData.uid,
        'email': userData.email,
        'displayName': userData.displayName,
        'photoURL': userData.photoURL,
        'rol': user['rol']
      }),
      context: context,
    );
  }

  void setUser({required BuildContext context, required UserModel user}) {
    context.read<UserProvider>().user = user;
  }

  Future<void> logout(BuildContext context) async {
    await _authImpl.signOut();
    await PreferencesShare.clearPreferences();
    await AppProviders.disposeAllDisposableProviders(context);
    context.router.replaceAll([const LoginRoute()]);
  }

  void launchSupport() async {
    LaunchUrlComponent.launchToWhatsApp(cellPhone: "+573209149704");
  }

  void handleRedirectSurvey() =>
      LaunchUrlComponent.launchURL("https://forms.gle/RgRCtdyBUMhXV7g49");

  void dispose() {}
}
