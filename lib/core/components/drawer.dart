import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/utility/shared_prefs.dart';
import 'package:step_in_style/models/helper_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../presentation/views/settings/settings_page.dart';
import '../providers/auth_provider.dart';
import '../utility/user_data_provider.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider).user;
    return Drawer(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                  // color: Colors.deepPurple,
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1601138061518-864051769be7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user?.fullName ?? '',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user?.email ?? '',
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 450,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: draweItems.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(draweItems[index]['icon']),
                  title: Text(draweItems[index]['title'](context)),
                  onTap: () {
                    if (draweItems[index]['onTap'] != null) {
                      draweItems[index]['onTap'](context);
                    }
                  },
                );
              },
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black12,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              AppLocalizations.of(context)!.settings_and_accounts,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(
              AppLocalizations.of(context)!.logout,
            ),
            onTap: () {
              final userProv = ref.read(userProvider);
              ref
                  .read(signOutProvider.future)
                  .then((_) => userProv.setUser = null);
            },
          ),
        ],
      ),
    );
  }
}
