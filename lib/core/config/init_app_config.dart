import 'package:firebase_core/firebase_core.dart';
import 'package:jiffy/jiffy.dart';
import 'package:task/core/di/di_config.dart';
import 'package:task/core/paths/dotenv.paths.dart';

Future<void> initAppConfig() async {
  await Firebase.initializeApp();
  await Jiffy.locale('es');
  await DotEnvAppPath.load();
  configureDependencies();
}

Future<void> initAppConfigTest() async {
  await DotEnvAppPath.initTest();
}
