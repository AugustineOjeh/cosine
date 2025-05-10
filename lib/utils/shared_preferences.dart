import 'package:shared_preferences/shared_preferences.dart';

final prefs = SharedPreferencesAsync();

class SharedPrefs {
  static Future<void> saveActiveProfile(String profileId) async =>
      await prefs.setString('active_profile_id', profileId);

  static Future<String?> retrieveActiveProfile() async =>
      await prefs.getString('active_profile_id');
}
