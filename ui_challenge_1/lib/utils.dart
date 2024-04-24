import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url))
      : throw 'Could not launch $url';
}
