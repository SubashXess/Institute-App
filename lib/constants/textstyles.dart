import 'package:flutter/material.dart';
import 'package:institute_app/constants/themes.dart';

class AppTextStyle {
  // static get fontFamily => GoogleFonts.roboto().fontFamily;

  static TextStyle h0TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w800,
      double size = 24.0}) {
    return TextStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h1TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w700,
      double size = 20.0}) {
    return TextStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h2TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w600,
      double size = 18.0}) {
    return TextStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h3TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w500,
      double size = 16.0}) {
    return TextStyle(fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h4TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w400,
      double? wordSpacing,
      double size = 14.0}) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
      wordSpacing: wordSpacing,
    );
  }
}
