import 'dart:async';
import 'package:cosine/features/auth/helper/auth_service.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (value == null || value.isEmpty || !emailRegex.hasMatch(value.trim())) {
      setState(() => _userExists = null);
      return;
    }
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(seconds: 1), () async {
      setState(() => _checkingUser = true);
      try {
        final res = await AuthService.checkIfEmailExists(context, value);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              SizedBox(
                  height: 14,
                  // child: _userExists == false
                  //     ? Text('No account found. Create one.',
                  //         style: CustomTextStyle.bodySmall(context,
                  //             color: CustomColor.error(context)))
                  //     : null
                      ),
              TextInput(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (_) => _submit(),
                  suffix: _checkingUser
                      ? CupertinoActivityIndicator(
                          color: CustomColor.secondary(context, opacity: 0.7),
                          radius: 8)
                      : _userExists == true
                          ? Icon(
                              Ionicons.checkmark_circle_outline,
                              size: 15,
                              color: Colors.green,
                            )
                          : null,
                  onChanged: (value) => _checkUser(value),
                  placeholder: 'Enter your email',
                  validator: (value) => AuthService.validateEmail(value)),
              PrimaryButton(
                  text: _userExists == false ? 'Create account' : 'Continue',
                  isLoading: _submiting,
                  onTap: _submit),
              SizedBox(
                width: double.infinity,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: CustomTextStyle.bodySmall(
                          context,
                        ),
                        children: [
                          TextSpan(text: 'By using Cosine, you agree to the '),

                          // TODO: Add link to Terms and Condition page
                          TextSpan(
                              text: 'Terms.',
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: CustomTextStyle.bodySmall(context,
                                  weight: CustomFontWeight.semiBold,
                                  color: CustomColor.headline(context))),
                        ])),
              )
            ],
          )),
    );
  }
}
