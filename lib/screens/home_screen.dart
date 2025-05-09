import 'package:cosine/features/auth/auth.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // final String profileId;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar.branded(context),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home!',
                style: CustomTextStyle.headlineMedium(context),
                textAlign: TextAlign.center,
              ),
              PrimaryButton(
                  text: 'Sign out',
                  onTap: () async => await AuthService.signOut(context))
            ],
          ),
        ),
      ),
    );
  }
}
