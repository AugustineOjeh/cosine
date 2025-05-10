import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ProfilePhoto {
  ///
  /// Square image holder of sides 180. Use in [ProfilePage].
  /// [onTap] should be trigger photo change or view.
  static Widget large(BuildContext context,
          {required String? image,
          required bool isUserImage,
          required bool userCanEdit,
          VoidCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: image == null
                    ? AssetImage(isUserImage
                        ? 'lib/assets/images/user-image-placeholder.png'
                        : 'lib/assets/images/school-logo-placeholder.png')
                    : NetworkImage(image),
                fit: BoxFit.contain),
          ),
          child: !userCanEdit
              ? null
              : Container(
                  padding: EdgeInsets.all(12),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.border(context),
                  ),
                  child: Icon(
                    Ionicons.camera_outline,
                    size: 32,
                    color: CustomColor.background(context, opacity: 0.4),
                  ),
                ),
        ),
      );

  ///
  /// Square image holder of sides 96. Use in [BottomSheet] topChild.
  ///
  static Widget medium(BuildContext context,
          {required String? image,
          required bool isUserImage,
          required bool userCanEdit,
          VoidCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 96,
          width: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: image == null
                    ? AssetImage(isUserImage
                        ? 'lib/assets/images/user-image-placeholder.png'
                        : 'lib/assets/images/school-logo-placeholder.png')
                    : NetworkImage(image),
                fit: BoxFit.contain),
          ),
        ),
      );

  /// Square image holder of sides 36. Use as [UserProfileButton].
  ///
  static Widget small(BuildContext context,
          {required String? image,
          required bool isUserImage,
          VoidCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: image == null
                    ? AssetImage(isUserImage
                        ? 'lib/assets/images/user-image-placeholder.png'
                        : 'lib/assets/images/school-logo-placeholder.png')
                    : NetworkImage(image),
                fit: BoxFit.contain),
          ),
        ),
      );

  /// Square image holder of sides 28. Use in [ListTile].
  /// [onTap] should be null for now.
  static Widget extraSmall(BuildContext context,
          {required String? image,
          required bool isUserImage,
          VoidCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: image == null
                    ? AssetImage(isUserImage
                        ? 'lib/assets/images/user-image-placeholder.png'
                        : 'lib/assets/images/school-logo-placeholder.png')
                    : NetworkImage(image),
                fit: BoxFit.contain),
          ),
        ),
      );
}
