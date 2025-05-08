import 'package:flutter/material.dart';

class CustomColor {
  ///
  static Color primary(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.primary.withValues(alpha: opacity);

  ///
  static Color onPrimary(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.onPrimary.withValues(alpha: opacity);

  ///
  static Color secondary(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.secondary.withValues(alpha: opacity);

  ///
  static Color headline(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: opacity);

  ///
  static Color bodyText(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.onSecondaryFixed.withValues(alpha: opacity);

  ///
  static Color background(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.surface.withValues(alpha: opacity);

  ///
  static Color error(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.error.withValues(alpha: opacity);

  ///
  static Color border(BuildContext context, {double? opacity}) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: opacity ?? 0.3);

  ///
  static Color bottomSheetBackground(BuildContext context, {double? opacity}) =>
      Theme.of(context)
          .colorScheme
          .secondaryContainer
          .withValues(alpha: opacity);

  ///
  static Color bottomSheetForeground(BuildContext context, {double? opacity}) =>
      Theme.of(context)
          .colorScheme
          .onSecondaryContainer
          .withValues(alpha: opacity);

  ///
  static Color groupContainerBackground(BuildContext context,
          {double? opacity}) =>
      Theme.of(context).colorScheme.primaryContainer.withValues(alpha: opacity);
}
