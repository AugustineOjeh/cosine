import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/screens/screens.dart';
import 'package:cosine/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Handles splash screen
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await Supabase.initialize(
    url: kReleaseMode ? SupabaseInit.prod.url : SupabaseInit.dev.url,
    anonKey: kReleaseMode ? SupabaseInit.prod.key : SupabaseInit.dev.key,
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

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async {
    final session = SupabaseInit.instance.auth.currentSession;
    if (session == null) {
      setState(() => _home = AuthScreen());
    } else {
      AuthNavigate.toHome(context);
    }
    FlutterNativeSplash.remove();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cosine',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        home: _home);
  }
}
