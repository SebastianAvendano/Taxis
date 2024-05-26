import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

class PreferencesShare {
  static SharedPreferences get _preferences =>
      injector.get<SharedPreferences>();

  static String get userId => _preferences.getString('userId') ?? '';
  static set userId(String id) => _preferences.setString('userId', id);

  static bool get activeSession =>
      _preferences.getBool('activeSession') ?? false;
  static set activeSession(bool status) =>
      _preferences.setBool('activeSession', status);

  static Future<bool> clearPreferences() async => await _preferences.clear();
}
