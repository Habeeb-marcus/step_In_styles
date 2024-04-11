import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_in_style/core/components/fabWithIcons.dart';
import 'package:step_in_style/core/extensions/image_path.dart';
import 'package:step_in_style/core/providers/cartProvider.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/views/bottomAppBarPages/home_screen.dart';
import 'package:step_in_style/presentation/views/bottomAppBarPages/favorite_page.dart';
import 'package:step_in_style/presentation/views/notification.dart';
import 'package:step_in_style/presentation/views/profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/components/drawer.dart';
import '../../../core/language/languagePopupMenu.dart';
import '../../../core/utility/darkmode/dark_theme_provider.dart';
import '../../styles/spacings.dart';
import '../../styles/text_styles.dart';
import '../bottomAppBarPages/widgets/search_widget.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key});

  @override
  ConsumerState<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends ConsumerState<DashBoard> {
  String _lastSelected = 'TAB: 0';

  final pages = [
    const HomeScreen(
      title: 'Step In Style',
    ),
    const FavoritePage(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  int _currentIndex = 0;
  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  // create circular bottom app bar with floating action button and a notch WIITH THE BOTH end of the app abr curved upward

  String changeTitle(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return 'Step In Style';
      case 1:
        return AppLocalizations.of(context)!.favorite;
      case 2:
        return AppLocalizations.of(context)!.notifications;
      case 3:
        return AppLocalizations.of(context)!.profile;
      default:
        return 'Step In Style';
    }
  }

  List<Widget>? switchActions(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        return HomeScreen.actions(context, ref);
      case 2:
        return NotificationPage.actions(
          context,
          onPressed: () {
            setState(() {
              notifications(context).clear();
            });
          },
        );
      case 3:
        return ProfilePage.actions;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          changeTitle(context),
          style: AppTextStyle.headerFour,
        ),
        centerTitle: true,
        actions: switchActions(context),
      ),
      body: pages[_currentIndex],
      drawer: const DrawerWidget(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color:
                    _currentIndex == 0 ? AppColors.primary : AppColors.black3,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                color:
                    _currentIndex == 1 ? AppColors.primary : AppColors.black3,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
                color:
                    _currentIndex == 2 ? AppColors.primary : AppColors.black3,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person_outlined,
                color:
                    _currentIndex == 3 ? AppColors.primary : AppColors.black3,
              ),
              onPressed: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
          // _buildFab1(context),
          Consumer(
        builder: (context, ref, child) {
          final int itemCount = ref.watch(cartProvider).cartlistItems.length;
          return Stack(
            children: [
              FloatingActionButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                ),
                elevation: 0,
                backgroundColor: AppColors.primary,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CartPageRoute);
                },
                child: const Icon(Icons.shopping_bag_outlined),
              ),
              Positioned(
                top: 0,
                right: 1,
                child: itemCount > 0
                    ? Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        constraints: BoxConstraints(
                          minWidth: sizer(true, 15, context),
                          minHeight: sizer(false, 15, context),
                        ),
                        child: Text(
                          '$itemCount',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sizer(true, 10, context),
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox.shrink(),
              )
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget _buildFab(BuildContext context) {
  final icons = [Icons.sms, Icons.mail, Icons.phone];
  return FabWithIcons(
    icons: icons,
    onIconTapped: (index) {},
  );
}
