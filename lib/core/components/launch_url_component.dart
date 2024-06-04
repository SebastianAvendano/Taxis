import 'package:url_launcher/url_launcher.dart';

class LaunchUrlComponent {
  static void launchURL(String url, {bool externalApp = false}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: (externalApp)
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault,
    )) throw 'Could not launch $uri';
  }

  static void launchToWhatsApp({required String cellPhone}) async {
    final Uri uri = Uri.parse(
        "https://api.whatsapp.com/send?phone=$cellPhone&text=${Uri.parse("Hola, necesito ayuda")}");
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }
}
