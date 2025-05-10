import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {required this.onTap,
      this.color,
      required this.icon,
      this.iconSize = 24,
      super.key});
  final VoidCallback onTap;
  final Color? color;
  final IconData icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        visualDensity: VisualDensity.compact,
        iconSize: iconSize,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onPressed: onTap,
        icon: Icon(
          icon,
          color: color ?? CustomColor.headline(context),
        ));
  }
}
