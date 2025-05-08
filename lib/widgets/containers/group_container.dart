import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class GroupContainer extends StatelessWidget {
  const GroupContainer(
      {required this.child,
      this.padding = const EdgeInsets.symmetric(vertical: 4),
      super.key});
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.groupContainerBackground(context),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
