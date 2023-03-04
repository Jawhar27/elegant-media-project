import 'package:elegant_media_project/utils/helper_util.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // "http://maps.google.com/maps?t=k&q=loc:47.5951518+-122.3316393";
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      printLogs("could not open the map");
    }
  }
}
