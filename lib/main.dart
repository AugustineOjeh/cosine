import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/screens/screens.dart';
import 'package:cosine/theme/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  runApp(ProviderScope(child: const CosineApp()));
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
    setState(() => _home = session == null ? AuthScreen() : LoadingScreen());
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

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async => await AuthNavigate.toHome(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Brandmark.logo(context),
                height: 48, fit: BoxFit.contain),
            Text('0.1.0 Alpha',
                style: CustomTextStyle.label(context,
                    weight: CustomFontWeight.semiBold),
                textAlign: TextAlign.right)
          ],
        ),
      ),
    );
  }
}
