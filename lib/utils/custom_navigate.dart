import 'package:flutter/material.dart';

class CustomNavigate {
  static Future noReturn(BuildContext context, Widget screen) =>
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => screen), (route) => false);

  static Future push(BuildContext context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
