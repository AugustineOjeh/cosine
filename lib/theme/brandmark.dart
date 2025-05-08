import 'package:flutter/material.dart';

/// Return the asset links based on current app theme.
class Brandmark {
  static String logo(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode
        ? 'lib/assets/images/logo_dark.png'
        : 'lib/assets/images/logo_light.png';
  }

  static String icon = 'lib/assets/images/logo_light.png';
}
