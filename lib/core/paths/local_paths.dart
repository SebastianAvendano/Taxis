import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocalAppPaths {
  static String imgLogo = dotenv.env['imgLogo']!;
  static String sliders = dotenv.env['sliders']!;
}
