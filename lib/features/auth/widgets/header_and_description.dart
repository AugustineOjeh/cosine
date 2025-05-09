import 'package:cosine/theme/theme.dart';
import 'package:flutter/material.dart';

class HeaderAndDescription extends StatelessWidget {
  const HeaderAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/images/logo_light.png',
            height: 18,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 12),
          Text(
            'Human. \nEducation. \nIntelligence. ',
            style: CustomTextStyle.titleMedium(context).copyWith(height: 1),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Text(
                'The all-in-one workspace for modern K-12 schools to automate operations.',
                style: CustomTextStyle.bodyLarge(context).copyWith(
                    color: CustomColor.headline(context), height: 1.3)),
          ),
        ],
      ),
    );
  }
}
