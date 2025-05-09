import 'package:cosine/features/auth/auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 16,
        children: [
          HeaderImage(),
          HeaderAndDescription(),
          SizedBox(height: 48),
          SignInForm(),
        ],
      ),
    )));
  }
}
