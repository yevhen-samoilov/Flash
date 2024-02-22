import 'package:flash/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemesFonts {
  static TextStyle h1({Color color = ThemesColors.h1}) => TextStyle(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.06,
        fontFamily: 'SF Pro Display',
        letterSpacing: 0.24,
      );
  static TextStyle h2({Color color = ThemesColors.h2}) => TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.07,
        fontFamily: 'SF Pro Display',
        letterSpacing: 0.20,
      );
  static TextStyle h3({Color color = ThemesColors.h3}) => TextStyle(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.07,
        fontFamily: 'SF Pro Display',
        letterSpacing: 0.18,
      );
  static TextStyle p({Color color = ThemesColors.p}) => TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.10,
        fontFamily: 'SF Pro Display',
      );
  static TextStyle pConversationChat({Color color = ThemesColors.p}) => TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.10,
        fontFamily: 'SF Pro Display',
      );
  static TextStyle conversationChat(
          {Color color = ThemesColors.conversationChat}) =>
      TextStyle(
        color: color,
        fontSize: 13,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w400,
        height: 1.11,
        letterSpacing: 0.26,
      );

  static TextStyle headerLBlock({Color color = ThemesColors.p}) => TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.08,
        fontFamily: 'SF Pro Display',
      );
  static TextStyle pLBlock({Color color = ThemesColors.lBody}) => TextStyle(
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Display',
        height: 1.12,
        letterSpacing: 0.24,
      );
  static TextStyle q({Color color = ThemesColors.q}) => TextStyle(
        color: color,
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        height: 1.10,
        fontFamily: 'SF Pro Display',
      );
  static TextStyle tooltipSmall({Color color = ThemesColors.p}) => TextStyle(
        color: color,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.10,
        fontFamily: 'SF Pro Display',
      );
  //Button
  static TextStyle classicButton({Color color = ThemesColors.white}) =>
      TextStyle(
        color: color,
        fontSize: 14,
        fontFamily: 'SF Pro Display',
        fontWeight: FontWeight.w600,
        height: 1.10,
        letterSpacing: 0.14,
      );
}
