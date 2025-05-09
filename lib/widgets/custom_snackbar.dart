import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void main(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: CustomTextStyle.bodySmall(context),
          ),
          elevation: 8,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: CustomColor.groupContainerBackground(context),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        ),
      );
}
