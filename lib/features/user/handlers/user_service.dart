import 'package:cosine/features/user/user.dart';
import 'package:cosine/theme/app_init.dart';
import 'package:cosine/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  static Future<CosineUser?> updateUserData(WidgetRef ref, BuildContext context,
      String userId, Map<String, dynamic> data) async {
    final req =
        SupabaseInit.instance.auth.updateUser(UserAttributes(data: data));
    final res = await SupabaseRequest.req(context, req);
    if (res == null || !context.mounted) return null;
    return await fetchUserData(ref, context, userId);
  }

  static Future<CosineUser?> fetchUserData(
      WidgetRef ref, BuildContext context, String userId) async {
    final req =
        SupabaseInit.instance.from('users').select().eq('id', userId).single();
    final res = await SupabaseRequest.req(context, req);
    if (res == null) return null;
    final user = CosineUser.fromJson(res);
    ref.read(userProvider.notifier).setUser(user);
    return user;
  }
}
