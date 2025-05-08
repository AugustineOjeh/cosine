import 'package:cosine/theme/app_init.dart';
import 'package:cosine/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: kReleaseMode ? AppInit.production.url : AppInit.development.url,
    anonKey: kReleaseMode ? AppInit.production.key : AppInit.development.key,
  );
  runApp(const CosineApp());
}

class CosineApp extends StatefulWidget {
  const CosineApp({super.key});

  @override
  State<CosineApp> createState() => _CosineAppState();
}

class _CosineAppState extends State<CosineApp> {
  Widget? _home;
  final String _version = '0.1.0';
  final String _versionName = 'Alpha';

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async {
    // Check for current user via Supabase

    // Set the state of _home to login screen is user is null or home is user is valid.
    setState(() => _home = null);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cosine',
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        home: _home ?? launch(context, _version, _versionName));
  }
}

Widget launch(BuildContext context, String version, String versionName) =>
    Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(Brandmark.logo(context), height: 48, fit: BoxFit.contain),
          Text(
            '$version $versionName',
            style: CustomTextStyle.label(context),
          )
        ],
      )),
    );
