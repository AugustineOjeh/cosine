import 'package:cosine/features/user/user.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserOnboardingForm extends ConsumerStatefulWidget {
  const UserOnboardingForm({required this.userId, super.key});
  final String userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserOnboardingFormState();
}

class _UserOnboardingFormState extends ConsumerState<UserOnboardingForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool _submitting = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submitting = true);
    final Map<String, String> data = {
      'first_name': _firstNameController.text.trim(),
      'last_name': _lastNameController.text.trim(),
    };
    try {
      await UserService.updateUserData(ref, context, widget.userId, data);
      if (!mounted) return;
      UserNavigates.toLobby(context, widget.userId);
    } finally {
      setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 48,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('What should we call you?',
                  style: CustomTextStyle.headlineMedium(context)),
              Text('Enter your full name set up your account.',
                  style: CustomTextStyle.bodyMedium(context)),
            ],
          ),
        ),
        Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 24,
              children: [
                TextInput(
                    controller: _firstNameController,
                    placeholder: 'First name',
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.name],
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'First name too short or missing';
                      }
                      return null;
                    },
                    maxLength: 50),
                TextInput(
                    controller: _lastNameController,
                    placeholder: 'Last name',
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.familyName],
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _submit(),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length < 2) {
                        return 'Last name too short or missing';
                      }
                      return null;
                    },
                    maxLength: 50),
              ],
            )),
        PrimaryButton(text: 'Continue', isLoading: _submitting, onTap: _submit)
      ],
    );
  }
}
