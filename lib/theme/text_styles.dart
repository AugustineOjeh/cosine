import 'package:flutter/material.dart';

class CustomTextStyle {
  ///
  static TextStyle titleLarge(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.titleLarge!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle titleMedium(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle titleSmall(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle headlineLarge(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle headlineMedium(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle headlineSmall(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle bodyLarge(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle bodyMedium(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle bodySmall(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);

  ///
  static TextStyle label(
    BuildContext context, {
    double? size,
    Color? color,
    FontWeight? weight,
    bool italic = false,
  }) =>
      Theme.of(context).textTheme.labelMedium!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal);
}

class CustomFontWeight {
  static FontWeight regular = FontWeight.normal;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.bold;
}
