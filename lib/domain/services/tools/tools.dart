import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Tools extends ChangeNotifier {
  static void clipboard(BuildContext context, String text) {
    try {
      Clipboard.setData(ClipboardData(text: text)).then((_) {});
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> share(String share, String subject) async {
    try {
      await Share.share(share);
    } catch (e) {
      log(e.toString());
    }
  }
}
