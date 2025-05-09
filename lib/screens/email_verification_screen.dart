import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({required this.email, super.key});
  final String email;

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _otpController = TextEditingController();
  bool submiting = false;

  void _submit() async {
    setState(() => submiting = true);
    try {
      await AuthService.verifyToken(context, widget.email, _otpController.text);
    } finally {
      setState(() => submiting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.branded(context),
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 64,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Verify your identity',
                        style: CustomTextStyle.headlineMedium(context),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Enter code that we sent to the email',
                        style: CustomTextStyle.bodyMedium(context),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.email,
                        style: CustomTextStyle.bodyMedium(context,
                            color: CustomColor.headline(context)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                PinInput(controller: _otpController, submit: _submit),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Didn\'t receive the code?',
                        style: CustomTextStyle.bodyMedium(context),
                        textAlign: TextAlign.center,
                      ),
                      submiting
                          ? CupertinoActivityIndicator(
                              color:
                                  CustomColor.secondary(context, opacity: 0.8),
                              radius: 12,
                            )
                          : Text(
                              'Resend',
                              style: CustomTextStyle.bodyMedium(context,
                                  weight: CustomFontWeight.semiBold,
                                  color: CustomColor.primary(context)),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
