import 'package:cosine/features/user/user.dart';
import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePictureBotton extends StatelessWidget {
  const ProfilePictureBotton(
      {required this.user, required this.isOwnProfile, super.key});
  final CosineUser user;
  final bool isOwnProfile;

  @override
  Widget build(BuildContext context) {
    return ProfilePhoto.small(context,
        image: user.image,
        isUserImage: true,
        onTap: () => CustomBottomSheet.dismissible(
              context,
              maxHeight: 0.6,
              initialChildSize: 0.6,
              child: BottomsheetContainer(
                title: 'Profile',
                topChild: GestureDetector(
                  onTap: () {
                    // TODO: Navigate to profile edit.
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfilePhoto.medium(context,
                          image: user.image,
                          userCanEdit: true,
                          isUserImage: true),
                      const SizedBox(height: 24),
                      Text(
                        user.fullName,
                        style: CustomTextStyle.headlineMedium(context,
                            color: CustomColor.bottomSheetForeground(context)),
                        textAlign: TextAlign.center,
                      ),
                      if (isOwnProfile)
                        Text(
                          user.email,
                          style: CustomTextStyle.bodyMedium(context,
                              color: CustomColor.bottomSheetForeground(context,
                                  opacity: 0.8)),
                          textAlign: TextAlign.center,
                        ),
                    ],
                  ),
                ),
                bottomChildren: [
                  CustomListTile(
                    title: 'Account setting',
                    leading: Icon(Ionicons.options_outline, size: 20),
                    onTap: () {},
                  ),
                  CustomListTile(
                    isDestructive: true,
                    title: 'Sign out',
                    leading: Icon(Ionicons.log_out_outline, size: 20),
                    onTap: () {},
                  ),
                  SizedBox(height: 24)
                ],
              ),
            ));
  }
}
