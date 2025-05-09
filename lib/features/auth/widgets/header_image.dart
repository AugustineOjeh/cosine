import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    String renderImage() {
      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
      return isDarkMode
          ? 'lib/assets/images/auth-image-dark.jpg'
          : 'lib/assets/images/auth-image-light.jpg';
    }

    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage(renderImage()), fit: BoxFit.fill)),
    );
  }
}
