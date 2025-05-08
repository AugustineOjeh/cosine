import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class DestructiveButton extends StatelessWidget {
  const DestructiveButton(
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
    return ElevatedButton(
        onPressed: isDisabled ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          alignment: Alignment.center,
          fixedSize: Size(double.infinity, 44),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          textStyle: CustomTextStyle.bodyMedium(context).copyWith(
              fontWeight: CustomFontWeight.semiBold,
              color:
                  CustomColor.error(context, opacity: isDisabled ? 0.5 : null)),
          backgroundColor:
              CustomColor.error(context, opacity: isDisabled ? 0.1 : 0.3),
        ),
        child: Text(text));
  }
}
