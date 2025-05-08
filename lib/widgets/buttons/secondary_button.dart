import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {required this.text,
      required this.onTap,
      required this.isSelected,
      required this.isOnScaffold,
      this.isDisabled = false,
      super.key});
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool isDisabled;
  final bool isOnScaffold;

  Color _getButtonColor(context) => isOnScaffold
      ? CustomColor.background(context, opacity: isDisabled ? 0.5 : null)
      : CustomColor.headline(context, opacity: isDisabled ? 0.5 : null);

  Color _selectableTextColor(context) => isOnScaffold
      ? CustomColor.headline(context, opacity: isDisabled ? 0.5 : null)
      : CustomColor.background(context, opacity: isDisabled ? 0.5 : null);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isDisabled || isSelected ? () {} : onTap,
        style: TextButton.styleFrom(
          elevation: 0,
          alignment: Alignment.center,
          fixedSize: Size(double.infinity, 44),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(width: 1, color: _getButtonColor(context))),
          textStyle: CustomTextStyle.bodyMedium(context).copyWith(
              fontWeight: CustomFontWeight.semiBold,
              color: isSelected
                  ? _selectableTextColor(context)
                  : _getButtonColor(context)),
          backgroundColor:
              isSelected ? _getButtonColor(context) : Colors.transparent,
        ),
        child: Text(text));
  }
}
