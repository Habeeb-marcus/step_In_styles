import 'package:flutter/material.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/text_styles.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                icon,
                color: AppColors.black3,
              ),
              title: Text(
                title,
                style: AppTextStyle.bodyOne,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: AppColors.black3,
              ),
            ),
            const Divider(color: Color(0xFFE9EDEF))
          ],
        ),
      ),
    );
  }
}
