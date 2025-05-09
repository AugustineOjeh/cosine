import 'package:cosine/screens/screens.dart';
import 'package:flutter/material.dart';

class AuthNavigate {
  static void toVerification(BuildContext context, String email) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmailVerificationScreen(email: email)));

  static void toHome(BuildContext context) {
    // Fetch user data to check for first and last name values.
    // If name is empty, navigate to user onboarding (no return allowed).
    // If name is not empty, check for existing profiles.
    // If profiles is empty, go to Lobby (no return allowed)
    // If profile is not empty, check for active profile in SharedPreference
    // If active profile is found, navigate to Home with active profile.
    // If no active profile is found, navigate to Home with first profile and save to sharedPreference in init.
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  static void leaveApp(BuildContext context) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
      (route) => false);
}
