import 'package:cosine/theme/theme.dart';
import 'package:cosine/widgets/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomsheetContainer extends StatelessWidget {
  const BottomsheetContainer(
      {this.bottomChildren,
      this.topChild,
      required this.title,
      this.action,
      super.key});

  /// The widget that stays on the top of the bottomsheet,
  /// Where background contrasts with [scaffoldBackground].
  /// [pop] navigation already added alongside the title widget, simply provide [title]
  final Widget? topChild;

  final Widget? action;

  /// The widget that stays on the bottom of the bottomsheet,
  /// beneath the high contrast top section.
  /// The background of this part is consistent with [scaffoldBackground].
  /// The holding container is already provided.
  /// Simply provide a child widget, ideally a [Column].
  final List<Widget>? bottomChildren;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: CustomColor.bottomSheetBackground(context),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 32,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Row(
              children: [
                CustomIconButton(
                    onTap: () => Navigator.pop(context),
                    color: CustomColor.bottomSheetForeground(context),
                    icon: Ionicons.chevron_back_outline),
                Expanded(
                    child: Text(
                  title,
                  style: CustomTextStyle.headlineSmall(context,
                      color: CustomColor.bottomSheetForeground(context)),
                  textAlign: TextAlign.center,
                )),
                SizedBox(width: 40, child: action)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: topChild,
          ),
          if (bottomChildren != null)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: CustomColor.background(context),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: SafeArea(
                  top: false,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
                      child: Column(
                        spacing: 12,
                        mainAxisSize: MainAxisSize.min,
                        children: bottomChildren!,
                      ))),
            )
        ],
      ),
    );
  }
}
