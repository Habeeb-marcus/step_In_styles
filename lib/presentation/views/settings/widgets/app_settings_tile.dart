import 'package:flutter/material.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/text_styles.dart';

class AppSettingsTile extends StatelessWidget {
  final String title;
  final bool value;
  final void Function(bool)? onChanged;
  const AppSettingsTile({super.key, required this.title, required this.value, this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: AppTextStyle.bodyOne,
            ),
            trailing: Switch.adaptive(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.white,
              activeTrackColor: AppColors.primary,
              inactiveThumbColor: AppColors.white,
              inactiveTrackColor: const Color(0xFFE4E4E4),
              trackOutlineColor:
                  const MaterialStatePropertyAll(Colors.transparent),
            ),
          ),
          const Divider(color: Color(0xFFE9EDEF))
        ],
      ),
    );
  }
}
