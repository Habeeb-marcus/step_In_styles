import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';

import '../../../core/utility/darkmode/dark_theme_provider.dart';
import '../../styles/text_styles.dart';
import 'widgets/app_settings_tile.dart';
import 'widgets/settings_tile.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool enableFaceID = false;
  bool enablePushNotification = false;
  bool enableLocationService = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
        ),
        centerTitle: true,
        title:  Text(
          AppLocalizations.of(context)!.settings_and_accounts,
          style:  const TextStyle(
          fontWeight: FontWeight.w600
        ) ,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VSpace.small,
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
               AppLocalizations.of(context)!.account,
                style: AppTextStyle.headerFour,
              ),
            ),
            SettingsTile(
              title: AppLocalizations.of(context)!.notification_settings,
              icon: Icons.notifications_on_outlined,
              onTap: () {},
            ),
            SettingsTile(
              title: AppLocalizations.of(context)!.shopping_address,
              icon: Icons.shopping_cart_outlined,
              onTap: () {},
            ),
            SettingsTile(
              title: AppLocalizations.of(context)!.payment_info,
              icon: Icons.payment_outlined,
              onTap: () {},
            ),
            SettingsTile(
              title: AppLocalizations.of(context)!.delete_account,
              icon: Icons.delete_outline,
              onTap: () {},
            ),
            VSpace.large,
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                AppLocalizations.of(context)!.app_settings,
                style: AppTextStyle.headerFour,
              ),
            ),
            AppSettingsTile(
              title: AppLocalizations.of(context)!.enable_face_id,
              value: enableFaceID,
              onChanged: (_) => setState(() => enableFaceID = !enableFaceID),
            ),
            AppSettingsTile(
              title: AppLocalizations.of(context)!.enable_notifications,
              value: enablePushNotification,
              onChanged: (_) => setState(
                  () => enablePushNotification = !enablePushNotification),
            ),
            AppSettingsTile(
              title: AppLocalizations.of(context)!.enable_location,
              value: enableLocationService,
              onChanged: (_) =>
                  setState(() => enableLocationService = !enableLocationService),
            ),
            AppSettingsTile(
              title: AppLocalizations.of(context)!.dark_mode,
              value: ref.watch(themeProvider).darkTheme,
              onChanged: (_) => setState(() => ref
                  .watch(themeProvider)
                  .setDarkTheme = !ref.watch(themeProvider).darkTheme),
            ),
          ],
        ),
      ),
    );
  }
}
