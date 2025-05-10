import 'package:cosine/models/models.dart';
import 'package:cosine/screens/screens.dart';
import 'package:cosine/theme/app_init.dart';
import 'package:cosine/utils/utils.dart';
import 'package:flutter/material.dart';

class AuthNavigate {
  static void toVerification(BuildContext context, String email) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EmailVerificationScreen(email: email)));

  static void toHome(BuildContext context) async {
    final user = SupabaseInit.instance.auth.currentUser;
    if (user == null) return;
    final meta = user.userMetadata;
    final hasFirstName = meta?['first_name'] != null &&
        meta!['first_name'].toString().trim().isNotEmpty;
    final hasLastName = meta?['last_name'] != null &&
        meta!['last_name'].toString().trim().isNotEmpty;
    if (!(hasLastName && hasFirstName)) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => UserOnboardingScreen()),
          (route) => false);
    } else {
      // Fetch all profiles
      final req = SupabaseInit.instance
          .from('profiles')
          .select()
          .eq('user_id', user.id);
      final res = await SupabaseRequest.req(context, req)
          as List<Map<String, dynamic>>?;
      if (res != null && res.isEmpty && context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LobbyScreen()),
            (route) => false);
        return;
      }
      if (res != null && res.isNotEmpty) {
        final profiles = res.map((a) => Profile.fromJson(a)).toList();
        final savedProfileId = await SharedPrefs.retrieveActiveProfile();
        final activeProfile = profiles.firstWhere((a) => a.id == savedProfileId,
            orElse: () => profiles.first);
        if (!context.mounted) return;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(profileId: activeProfile.id)),
            (route) => false);
      }
    }
  }

  static void leaveApp(BuildContext context) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AuthScreen()),
      (route) => false);
}
