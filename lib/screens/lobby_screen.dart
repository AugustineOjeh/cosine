import 'package:cosine/features/lobby/widgets/invitation_container.dart';
import 'package:cosine/features/user/user.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({required this.userId, super.key});
  final String userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await UserService.fetchUserData(ref, context, widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: CustomAppbar.branded(context, leftAlignLogo: true, actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ProfilePhoto.small(context,
              image: user?.image, isUserImage: true, onTap: () {}),
        )
      ]),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 48,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  Text(
                    'Hi, ${user?.firstName ?? ''}',
                    style: CustomTextStyle.headlineMedium(context),
                  ),
                  Text(
                    'Thanks for choosing Cosine. You will find your pending invitations here.',
                    style: CustomTextStyle.bodyMedium(context),
                  ),
                ],
              ),
              InvitationsContainer(),
              PrimaryButton(text: 'Create a school', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
