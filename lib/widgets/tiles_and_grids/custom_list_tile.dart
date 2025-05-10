import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {this.leading,
      required this.title,
      this.subtitle,
      this.dense = true,
      this.color,
      this.onTap,
      this.onLongPress,
      this.isDestructive = false,
      this.enabled = true,
      super.key});
  final Widget? leading;
  final String title;
  final String? subtitle;
  final Color? color;
  final bool enabled;
  final bool dense;
  final bool isDestructive;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? CustomColor.groupContainerBackground(context)),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        dense: dense,
        onTap: !enabled ? null : onTap,
        onLongPress: onLongPress,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        iconColor: isDestructive
            ? CustomColor.error(context)
            : CustomColor.headline(context),
        titleTextStyle: CustomTextStyle.bodyMedium(context),
        horizontalTitleGap: 12,
        enabled: enabled,
        leading: leading,
        title: Text(title,
            style: CustomTextStyle.bodyMedium(context,
                color: isDestructive
                    ? CustomColor.error(context)
                    : CustomColor.headline(context)),
            overflow: TextOverflow.ellipsis),
        subtitle: subtitle == null
            ? null
            : Text(subtitle!,
                style: CustomTextStyle.bodySmall(context,
                    color: isDestructive ? CustomColor.error(context) : null),
                overflow: TextOverflow.ellipsis),
        trailing: !enabled
            ? null
            : Icon(Ionicons.chevron_forward_outline,
                size: 16, color: CustomColor.border(context)),
      ),
    );
  }
}
