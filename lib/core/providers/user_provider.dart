import 'package:task/data/models/profile/user_model.dart';

import 'disposable_provider.dart';

class UserProvider extends DisposableProvider {
  UserModel _user = const UserModel();

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  @override
  void disposeValues() {
    _user = const UserModel();
  }
}
