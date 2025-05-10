import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/models/models.dart';
import 'package:cosine/screens/screens.dart';
import 'package:cosine/theme/app_init.dart';
import 'package:cosine/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthNavigate {
  static void toVerification(BuildContext context, String email) =>
      CustomNavigate.push(context, EmailVerificationScreen(email: email));

  static Future<void> toHome(BuildContext context) async {
    final user = SupabaseInit.instance.auth.currentUser;
    if (user == null) return;
    final meta = user.userMetadata;
    final hasFirstName = meta?['first_name'] != null &&
        meta!['first_name'].toString().trim().isNotEmpty;
    final hasLastName = meta?['last_name'] != null &&
        meta!['last_name'].toString().trim().isNotEmpty;
    if (!(hasLastName || hasFirstName)) {
      CustomNavigate.noReturn(context, UserOnboardingScreen(userId: user.id));
      return;
    } else {
      final res = await AuthService.fetchProfiles(context, user.id);
      if (res != null && res.isEmpty && context.mounted) {
        CustomNavigate.noReturn(context, LobbyScreen(userId: user.id));
        return;
      }
      if (res != null && res.isNotEmpty) {
        final profiles = res.map((a) => Profile.fromJson(a)).toList();
        final savedProfileId = await SharedPrefs.retrieveActiveProfile();
        final activeProfile = profiles.firstWhere((a) => a.id == savedProfileId,
            orElse: () => profiles.first);
        if (!context.mounted) return;
        CustomNavigate.noReturn(
            context, HomeScreen(profileId: activeProfile.id));
      }
    }
  }
}
