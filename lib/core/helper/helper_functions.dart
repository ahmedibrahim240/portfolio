import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static Future<void> launchToUrl(Uri uri) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        debugPrint('Could not launch Google Maps');
      }
    } catch (e) {
      debugPrint('Error starting navigation: $e');
    }
  }
}
