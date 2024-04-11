import 'package:flutter/material.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final images = [
  'https://images.unsplash.com/photo-1601138061518-864051769be7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
  'https://images.unsplash.com/photo-1553913861-c0fddf2619ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1559564484-e48b3e040ff4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1532664189809-02133fee698d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
];



final List draweItems = [
  // profile
  {
    'icon': Icons.person,
    'title': (BuildContext context) =>  AppLocalizations.of(context)!.profile,
    'onTap': (context) {
      Navigator.of(context).pushNamed(AppRoutes.profileRoute);
    }
  },
  {
    'icon': Icons.home,
    'title':(BuildContext context) =>  AppLocalizations.of(context)!.home,
    'onTap': (context) {

      Navigator.of(context).pushNamed(AppRoutes.dashboardRoute);
    }
  },

  {
    'icon': Icons.star,
    'title':(BuildContext context) =>  AppLocalizations.of(context)!.favorite,
    'onTap': (context) {
      Navigator.of(context).pushNamed(AppRoutes.favoritePageRoute);
    }
  },

  {
    'icon': Icons.notifications,
    'title': (BuildContext context) =>  AppLocalizations.of(context)!.notifications,
    'onTap': (context) {
      Navigator.of(context).pushNamed(AppRoutes.notificationPageRoute);
    }
  },
  {
    'icon': Icons.shopping_cart,
    'title': (BuildContext context) =>  AppLocalizations.of(context)!.orders,
    'onTap': (context) {
      Navigator.of(context).pushNamed(AppRoutes.CartPageRoute);
    }
  },

  {
    'icon': Icons.delete,
    'title': (BuildContext context) =>  AppLocalizations.of(context)!.delete_account,
    'onTap': (context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Reset settings?'),
                content: const Text(
                    'This will reset your device to its default factory settings. Your data will be erased.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Cancel');
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Accept');
                    },
                    child: const Text('Accept'),
                  ),
                ],
              ));

      print('Trash');
    }
  },
];
