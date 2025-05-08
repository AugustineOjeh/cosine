import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SelectableButton extends StatelessWidget {
  const SelectableButton(
      {required this.text,
      required this.onTap,
      required this.isSelected,
      this.isDisabled = false,
      super.key});
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: isDisabled || isSelected ? () {} : onTap,
        style: TextButton.styleFrom(
            elevation: 0,
            alignment: Alignment.center,
            fixedSize: Size(double.infinity, 44),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: CustomTextStyle.bodyMedium(context).copyWith(
                fontWeight: CustomFontWeight.semiBold,
                color: CustomColor.bodyText(context,
                    opacity: isDisabled ? 0.5 : null)),
            foregroundColor:
                CustomColor.bodyText(context, opacity: isDisabled ? 0.5 : null),
            backgroundColor: isSelected
                ? CustomColor.primary(context, opacity: 0.3)
                : CustomColor.groupContainerBackground(context,
                    opacity: isDisabled ? 0.5 : null)),
        icon: Icon(
            isSelected ? Ionicons.checkbox_outline : Ionicons.square_outline,
            size: 16),
        label: Text(text));
  }
}
