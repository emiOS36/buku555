import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF2E7D4F);
  static const Color onPrimary = Colors.white;
}

abstract final class AppSizes {
  static const double radius = 12;
  static const double screenPadding = 16;
  static const double fieldPadding = 16;

  static BorderRadius get borderRadius => BorderRadius.circular(radius);
}
