import 'package:cosine/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, CosineUser?>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<CosineUser?> {
  UserNotifier() : super(null);

  Future<void> loadUser(
      WidgetRef ref, BuildContext context, String userId) async {
    final user = await UserService.fetchUserData(ref, context, userId);
    state = user;
  }

  void setUser(CosineUser user) {
    state = user;
  }

  void clearUser() {
    state = null;
  }
}
