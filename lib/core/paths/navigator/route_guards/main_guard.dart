import 'package:auto_route/auto_route.dart';
import 'package:task/data/share/preferences_share.dart';

class MainGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (PreferencesShare.activeSession) {
      resolver.next(true);
    } else {
      router.replaceNamed("");
    }
  }
}
