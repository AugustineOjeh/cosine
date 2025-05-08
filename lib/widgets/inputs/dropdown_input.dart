import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DropdownInput extends StatelessWidget {
  const DropdownInput(
      {required this.options,
      required this.selectedValue,
      required this.onChanged,
      this.validator,
      this.placeholder,
      this.isDisabled = false,
      super.key});
  final Map<dynamic, String> options;
  final dynamic selectedValue;
  final void Function(dynamic) onChanged;
  final String? Function(dynamic)? validator;
  final bool isDisabled;
  final String? placeholder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: options.entries
          .map((e) => DropdownMenuItem<dynamic>(
              value: e.key,
              child: Text(
                e.value,
                style: CustomTextStyle.bodySmall(context),
                overflow: TextOverflow.ellipsis,
              )))
          .toList(),
      iconSize: 16,
      elevation: 2,
      isDense: true,
      menuMaxHeight: 480,
      validator: validator,
      value: selectedValue,
      onChanged: onChanged,
      style: CustomTextStyle.bodyMedium(context),
      icon: Icon(Ionicons.chevron_down_outline,
          color: CustomColor.border(context)),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: placeholder ?? 'Select option',
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        hintStyle: CustomTextStyle.bodyMedium(context)
            .copyWith(color: CustomColor.border(context)),
        fillColor: CustomColor.groupContainerBackground(context),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: CustomColor.error(context)),
            borderRadius: BorderRadius.circular(12)),
        errorStyle: CustomTextStyle.label(context)
            .copyWith(color: CustomColor.error(context)),
      ),
    );
  }
}
