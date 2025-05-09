import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {required this.controller,
      this.validator,
      this.autoFocus = false,
      this.isReadOnly = false,
      this.autocorrect = false,
      this.keyboardType,
      this.onFieldSubmitted,
      this.textCapitalization,
      this.textInputAction,
      this.initialValue,
      this.onChanged,
      this.placeholder,
      this.suffix,
      this.maxLines,
      this.maxLength,
      super.key});
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isReadOnly;
  final bool autoFocus;
  final bool autocorrect;
  final Function(String)? onFieldSubmitted;
  final String? initialValue;
  final String? placeholder;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final Widget? suffix;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        autofocus: autoFocus,
        initialValue: initialValue,
        cursorColor: CustomColor.secondary(context, opacity: 0.7),
        validator: validator,
        onChanged: onChanged,
        autocorrect: autocorrect,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        maxLength: maxLength,
        readOnly: isReadOnly,
        maxLines: maxLines ?? 1,
        enableSuggestions: true,
        style: CustomTextStyle.bodyMedium(context),
        decoration: InputDecoration(
          isDense: true,
          suffix: suffix,
          hintText: placeholder,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          hintStyle: CustomTextStyle.bodyMedium(context)
              .copyWith(color: CustomColor.border(context)),
          filled: true,
          fillColor: CustomColor.groupContainerBackground(context),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1, color: CustomColor.error(context)),
              borderRadius: BorderRadius.circular(12)),
          errorStyle: CustomTextStyle.label(context)
              .copyWith(color: CustomColor.error(context)),
        ));
  }
}
