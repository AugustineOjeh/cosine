import 'dart:async';
import 'package:cosine/features/auth/helper/auth_service.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:ionicons/ionicons.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _submiting = false;
  bool _checkingUser = false;
  bool? _userExists;
  Timer? _debounceTimer;

  void _checkUser(String? value) async {
    if (value == null || value.isEmpty) {
      setState(() => _userExists = null);
      return;
    }
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(seconds: 1), () async {
      setState(() => _checkingUser = true);
      try {
        final res = await AuthService.checkEmailExistence(context, value);
        setState(() => _userExists = res);
      } finally {
        setState(() => _checkingUser = false);
      }
    });
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _submiting = true);
    try {
      await AuthService.signIn(context, _emailController.text);
    } finally {
      setState(() => _submiting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              TextInput(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  suffix: _checkingUser
                      ? const CupertinoActivityIndicator(radius: 6)
                      : _userExists == true
                          ? Icon(
                              Ionicons.checkmark_circle_outline,
                              size: 10,
                              color: CustomColor.primary(context),
                            )
                          : null,
                  onChanged: (value) => _checkUser(value),
                  placeholder: 'Enter your email',
                  validator: (value) => AuthService.validateEmail(value)),
              PrimaryButton(
                  text: _userExists == false ? 'Create account' : 'Continue',
                  isLoading: _submiting,
                  onTap: _submit),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: CustomTextStyle.label(
                        context,
                      ),
                      children: [
                        TextSpan(text: 'By using Cosine, you agree to the '),
                        TextSpan(
                            text: 'Terms.',
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: CustomTextStyle.label(context,
                                weight: CustomFontWeight.semiBold,
                                color: CustomColor.headline(context))),
                      ]))
            ],
          )),
    );
  }
}
