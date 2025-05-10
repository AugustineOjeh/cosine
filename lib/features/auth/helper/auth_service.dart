import 'dart:io';
import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/screens/screens.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/utils/utils.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  static Future<bool?> checkIfEmailExists(
      BuildContext context, String value) async {
    try {
      final res = await SupabaseInit.instance
          .from('users')
          .select()
          .eq('email', value)
          .single();
      return res.isNotEmpty ? true : false;
    } on PostgrestException {
      return false;
    } on SocketException {
      if (!context.mounted) return null;
      CustomSnackbar.main(
          context, 'No internet connection. Check your network.');
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> signIn(BuildContext context, String email) async {
    final req = SupabaseInit.instance.auth.signInWithOtp(email: email);
    final res = await SupabaseRequest.auth(context, req);
    if (!res || !context.mounted) return;
    AuthNavigate.toVerification(context, email);
  }

  static Future<void> verifyToken(
      BuildContext context, String email, String token) async {
    final req = SupabaseInit.instance.auth
        .verifyOTP(type: OtpType.email, email: email, token: token);
    final res = await SupabaseRequest.auth(context, req);
    final session = SupabaseInit.instance.auth.currentSession;
    if (!res || !context.mounted || session == null) return;
    AuthNavigate.toHome(context);
  }

  static Future<List<Map<String, dynamic>>?> fetchProfiles(
      BuildContext context, String userId) async {
    final req =
        SupabaseInit.instance.from('profiles').select().eq('user_id', userId);
    return await SupabaseRequest.req(context, req)
        as List<Map<String, dynamic>>?;
  }

  static Future<void> signOut(BuildContext context) async {
    await SupabaseInit.instance.auth.signOut();
    if (!context.mounted) return;
    CustomNavigate.noReturn(context, AuthScreen());
  }
}
