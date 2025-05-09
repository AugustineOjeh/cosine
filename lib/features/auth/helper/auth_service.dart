import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/utils/supabase_request.dart';
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

  static Future<bool> checkIfEmailExists(
      BuildContext context, String value) async {
    final req = SupabaseInit.instance
        .from('users')
        .select()
        .eq('email', value)
        .single();
    final res = await SupabaseRequest.req(context, req);
    return res == null ? false : true;
  }

  static Future<void> signIn(BuildContext context, String email) async {
    final req = SupabaseInit.instance.auth.signInWithOtp(email: email);
    final res = await SupabaseRequest.auth(context, req);
    if (!res || !context.mounted) return;
    AuthNavigate.toVerification(context, email);
  }

  static Future<void> verifyToken(
      BuildContext context, String email, String token) async {
    // Make supabase call.
    AuthNavigate.toHome(context);
  }
}
