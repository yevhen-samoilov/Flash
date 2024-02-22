import 'dart:developer';
import 'package:flash/themes/theme_colors.dart';
import 'package:flash/themes/themes_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Tools extends ChangeNotifier {
  static void clipboard(BuildContext context, String text) {
    try {
      Clipboard.setData(ClipboardData(text: text)).then((_) {
        final messengerState = ScaffoldMessenger.of(context);
        messengerState.hideCurrentSnackBar();
        messengerState
            .showSnackBar(SnackBar(
                backgroundColor: ThemesColors.black,
                content: Text(
                  'Text Copy',
                  style:
                      ThemesFonts.p(),
                )))
            .closed
            .then((value) {
          messengerState.hideCurrentSnackBar();
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }

  // static Future<void> share(
  //     LoadingController loadingController, String share, String subject) async {
  //   loadingController.setVisibleLoading = true;
  //   try {
  //     await Share.share(share);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   loadingController.setVisibleLoading = false;
  // }
}
