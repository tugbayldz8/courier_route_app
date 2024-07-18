import 'package:url_launcher/url_launcher.dart';

final class BaseUrlLauncher {
  const BaseUrlLauncher._();

  static Future<bool> phone() async {
    const url = 'tel:+905360728684';
    if (await canLaunchUrl(Uri.parse(url))) {
      return launchUrl(
        Uri.parse(url),
      );
    } else {
      return false;
    }
  }

  static Future<bool> mail() async {
    const mail = 'mailto:tugbaay228@gmail.com';
    if (await canLaunchUrl(Uri.parse(mail))) {
      return launchUrl(
        Uri.parse(mail),
      );
    } else {
      return false;
    }
  }
}
