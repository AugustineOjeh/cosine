import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Auth Screen!',
          style: CustomTextStyle.headlineMedium(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
