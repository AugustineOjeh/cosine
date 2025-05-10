import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomAppbar {
  /// This [AppBar] has the [Cosine] logo at the top right corner.
  /// Leading [Back] button is automatically implied.
  static AppBar branded(BuildContext context,
          {bool leftAlignLogo = false,
          List<Widget>? actions,
          bool implyLeading = true}) =>
      AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: implyLeading,
        title: Row(
          mainAxisAlignment:
              leftAlignLogo ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            Image.asset(
              Brandmark.logo(context),
              height: 18,
              fit: BoxFit.contain,
            )
          ],
        ),
        actions: actions,
      );

  /// This [AppBar] doesn't have the [Cosine] branding.
  /// Use for screens with title and actions.
  static AppBar unbranded(BuildContext context,
          {required String title, List<Widget>? actions}) =>
      AppBar(
        scrolledUnderElevation: 8,
        surfaceTintColor: CustomColor.background(context, opacity: 0.6),
        centerTitle: true,
        title: Text(title, style: CustomTextStyle.headlineSmall(context)),
        actions: actions,
      );
}
