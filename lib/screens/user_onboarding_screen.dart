import 'package:cosine/features/user/user.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserOnboardingScreen extends StatefulWidget {
  const UserOnboardingScreen({required this.userId, super.key});
  final String userId;

  @override
  State<UserOnboardingScreen> createState() => _UserOnboardingScreenState();
}

class _UserOnboardingScreenState extends State<UserOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.branded(context),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: UserOnboardingForm(userId: widget.userId),
        ),
      ),
    );
  }
}
