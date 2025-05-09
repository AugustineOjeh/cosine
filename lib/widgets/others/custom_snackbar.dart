import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void main(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: CustomTextStyle.bodyMedium(context,
                color: Theme.of(context).colorScheme.onInverseSurface),
          ),
          behavior: SnackBarBehavior.floating,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Theme.of(context).colorScheme.inverseSurface,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        ),
      );
}
