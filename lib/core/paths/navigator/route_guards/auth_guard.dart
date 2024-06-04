import 'package:auto_route/auto_route.dart';
import 'package:AeroTaxi/data/share/preferences_share.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (PreferencesShare.activeSession) {
      router.replaceNamed("/main");
    } else {
      resolver.next(true);
    }
  }
}
