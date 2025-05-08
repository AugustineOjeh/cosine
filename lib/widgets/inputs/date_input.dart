import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DateInput extends StatefulWidget {
  const DateInput(
      {required this.controller,
      required this.canSelectFutureDate,
      required this.canSelectPastDate,
      this.validator,
      this.onChanged,
      this.initialValue,
      this.placeholder,
      super.key});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? initialValue;
  final String? placeholder;
  final bool canSelectFutureDate;
  final bool canSelectPastDate;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      keyboardType: TextInputType.datetime,
      firstDate: widget.canSelectPastDate ? DateTime(1950) : DateTime.now(),
      lastDate: widget.canSelectFutureDate ? DateTime(2100) : DateTime.now(),
      switchToInputEntryModeIcon: Icon(Ionicons.create_outline, size: 24),
      switchToCalendarEntryModeIcon:
          Icon(Ionicons.calendar_number_outline, size: 24),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = _formatDate(picked);
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: () => _pickDate(context),
        maxLines: 1,
        readOnly: true,
        style: CustomTextStyle.bodyMedium(context),
        decoration: InputDecoration(
          isDense: true,
          suffix: Icon(Ionicons.calendar_outline),
          hintText: widget.placeholder ?? 'Pick a date',
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
