import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class CenterDialogContainer extends StatelessWidget {
  const CenterDialogContainer(
      {required this.child,
      this.padding = const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      super.key});
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.background(context),
        border: Border.all(width: 1, color: CustomColor.border(context)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
