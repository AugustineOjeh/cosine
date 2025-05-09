import 'package:cosine/features/auth/helper/auth_navigate.dart';
import 'package:flutter/material.dart';

class AuthService {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter your email';
    }
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Email not valid';
    }
    return null;
  }

  static Future<bool> checkEmailExistence(
      BuildContext context, String value) async {
    // Make supabase call.
    return false;
  }

  static Future<void> signIn(BuildContext context, String email) async {
    // Make supabase call.
    AuthNavigate.toVerification(context, email);
  }

  static Future<void> verifyToken(
      BuildContext context, String email, String token) async {
    // Make supabase call.
    AuthNavigate.toHome(context);
  }
}
