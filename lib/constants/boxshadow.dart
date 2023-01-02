import 'package:flutter/material.dart';

class AppBoxShadow {
  static BoxShadow s0BoxShadow(
      {Color color = Colors.black, double blurRadius = 14.0}) {
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
    );
  }

  static BoxShadow s1BoxShadow(
      {Color color = Colors.black,
      double blurRadius = 14.0,
      double x = 0.0,
      double y = 0.0}) {
    return BoxShadow(
        color: color, blurRadius: blurRadius, offset: Offset(x, y));
  }
}
