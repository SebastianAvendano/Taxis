import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalAppPaths {
  static String imgLogo = dotenv.env['imgLogo']!;
  static String slider_1 = dotenv.env['slider_1']!;
  static String slider_2 = dotenv.env['slider_2']!;
}
