import 'package:cosine/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {required this.text,
      required this.onTap,
      this.isDisabled = false,
      this.isLoading = false,
      super.key});
  final String text;
  final VoidCallback onTap;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: isDisabled ? () {} : onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            alignment: Alignment.center,
            fixedSize: Size(double.infinity, 44),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: CustomTextStyle.bodyMedium(context).copyWith(
                fontWeight: CustomFontWeight.semiBold,
                color: CustomColor.onPrimary(context,
                    opacity: isDisabled ? 0.5 : null)),
            backgroundColor:
                CustomColor.primary(context, opacity: isDisabled ? 0.5 : null),
          ),
          child: isLoading
              ? CupertinoActivityIndicator(
                  radius: 8,
                  color: CustomColor.secondary(context, opacity: 0.6),
                )
              : Text(
                  text,
                  style: CustomTextStyle.bodyMedium(context,
                      weight: CustomFontWeight.bold,
                      color: CustomColor.onPrimary(context)),
                )),
    );
  }
}
