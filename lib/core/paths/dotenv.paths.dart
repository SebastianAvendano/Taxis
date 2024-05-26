import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvAppPath {
  static Future<void> load() async =>
      await dotenv.load(fileName: "assets/.env");

  static Future<void> initTest() async {
    await DotEnvAppPath.loadTest();
  }

  static Future<void> loadTest() async =>
      dotenv.testLoad(fileInput: File("assets/.env").readAsStringSync());
}
