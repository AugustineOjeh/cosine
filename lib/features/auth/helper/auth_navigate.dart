import 'package:flutter/material.dart';

class AuthNavigate {
  static void toVerification(BuildContext context, String email) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Placeholder()));

  static void toHome(BuildContext context) {
    // Fetch user data to check for first and last name values.
    // If name is empty, navigate to user onboarding (no return allowed).
    // If name is not empty, check for existing profiles.
    // If profiles is empty, go to Lobby (no return allowed)
    // If profile is not empty, check for active profile in SharedPreference
    // If active profile is found, navigate to Home with active profile.
    // If no active profile is found, navigate to Home with first profile and save to sharedPreference in init.
  }
}
