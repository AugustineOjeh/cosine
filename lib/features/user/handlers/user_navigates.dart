import 'package:cosine/screens/lobby_screen.dart';
import 'package:cosine/utils/utils.dart';
import 'package:flutter/material.dart';

class UserNavigates {
  static toLobby(BuildContext context, String userId) =>
      CustomNavigate.noReturn(context, LobbyScreen(userId: userId));
}
