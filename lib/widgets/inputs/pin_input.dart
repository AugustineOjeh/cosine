import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinInput extends StatelessWidget {
  const PinInput(
      {required this.controller,
      required this.submit,
      this.onChanged,
      this.validator,
      this.autoFocus = true,
      this.obscureText = false,
      this.length,
      super.key});
  final int? length;
  final TextEditingController controller;
  final VoidCallback submit;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool autoFocus;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: length ?? 6,
      controller: controller,
      onCompleted: (_) => submit(),
      onSubmitted: (_) => submit(),
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      autofocus: autoFocus,
      textInputAction: TextInputAction.done,
      defaultPinTheme: PinTheme(
          // margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(12),
          width: 50,
          height: 50,
          textStyle: CustomTextStyle.headlineSmall(context),
          decoration: BoxDecoration(
            color: CustomColor.groupContainerBackground(context),
            borderRadius: BorderRadius.circular(12),
          )),
      errorPinTheme: PinTheme(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(12),
          width: 44,
          height: 44,
          textStyle: CustomTextStyle.headlineSmall(context),
          decoration: BoxDecoration(
            color: CustomColor.error(context, opacity: 0.1),
            border: Border.all(width: 1, color: CustomColor.error(context)),
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
