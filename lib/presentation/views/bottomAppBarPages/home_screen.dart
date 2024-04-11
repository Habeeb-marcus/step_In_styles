// Dashboard class
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_in_style/core/components/cards/product_card.dart';
import 'package:step_in_style/core/components/drawer.dart';
import 'package:step_in_style/core/extensions/image_path.dart';
import 'package:step_in_style/core/providers/auth_provider.dart';
import 'package:step_in_style/core/providers/local_provider.dart';
import 'package:step_in_style/core/providers/wishlist_provider.dart';
import 'package:step_in_style/core/repository/firestore_repo.dart';
import 'package:step_in_style/core/utility/darkmode/dark_theme_provider.dart';
import 'package:step_in_style/core/language/languagePopupMenu.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/models/product_card.dart';
import 'package:step_in_style/models/users_model.dart';
import 'package:step_in_style/presentation/animations/fade_in_slide.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/search_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  static List<Widget> actions(BuildContext context,[WidgetRef? ref]) {
    final isDarkTheme = ref?.watch(themeProvider).darkTheme;
    return [
      IconButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SearchWidget()));
        },
        icon: SvgPicture.asset(
          'search'.isvg,
          // ignore: deprecated_member_use
          color: (isDarkTheme ?? false) ? Colors.white : Colors.black,
        ),
      ),
      const LanguagePopupMenu(),
      HSpace.small,
    ];
  }

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late String _currentLocale;
  @override
  initState() {
    Future.delayed(Duration.zero, () {
      // final user = UsersModel.defaultValue();
      // log(user.toString());
      // ref
      //     // .watch(createAccountWithPasswordProvider
      //     //     .call(
      //     //         fullName: user.fullName!,
      //     //         email: user.email!,
      //     //         password: 'password')
      //     //     .future)
      //     .watch(
      //         signInWithPasswordProvider.call(user.email!, 'password').future)
      //     .then((value) => log(value.toString()))
      //     .catchError((e) => log(e.toString()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const
        // _coubter variable
        int counter = 0;

    void changeLanguage(Locale newLocale) {
      // Update the locale using the provider
      ref.read(localeProvider.notifier).state = newLocale;
    }

    void changeAppLanguage(WidgetRef ref, String languageCode) {
      // Here, you could add additional logic to ensure `languageCode` is one of the supported locales
      ref.read(localeProvider.notifier).state = Locale(languageCode, '');
    }

    List<String> list = [
      'assets/images/puma.png',
      'assets/images/nike.png',
      'assets/images/helix.png',
      'assets/images/adidas.png',
      'assets/images/converse.png',
    ];

    return Scaffold(
      // drawer: const DrawerWidget(),
      // backgroundColor: themeChangeProvider.darkTheme ? AppColors.
      // secondary : AppColors.greyBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sizer(true, 20, context),
                  vertical: sizer(false, 25, context)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                children: <Widget>[
                  // search bar field

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: list
                        .map((e) => FadeInSlide(
                              duration: 1.1,
                              child: Image.asset(
                                e,
                                width: sizer(true, 60, context),
                                height: sizer(false, 60, context),
                              ),
                            ))
                        .toList(),
                  ),
                  VSpace.large,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.best_seller,
                        style: AppTextStyle.bodyFour.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: sizer(true, 18, context)),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(() => ProductDetail());
                          Navigator.pushNamed(
                              context, AppRoutes.BestSellerPageRoute);
                        },
                        child: Text(
                          AppLocalizations.of(context)!.view_all,
                          style: AppTextStyle.bodyTwo.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w300,
                              fontSize: sizer(true, 12, context)),
                        ),
                      ),
                    ],
                  ),

                  VSpace.large,

                  // list of popular shoes
                  GridView.builder(
                    itemCount: productData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: sizer(true, 15, context),
                      mainAxisSpacing: 17,
                      childAspectRatio: sizer(true, 152, context) /
                          sizer(false, 201, context),
                    ),
                    // separatorBuilder: (context, index) => HSpace.small,
                    itemBuilder: (context, index) {
                      return FadeInSlide(
                        duration: productData[index].anim_duration!,
                        child: product_card(
                          title: productData[index].title,
                          price: productData[index].price,
                          image: productData[index].image,
                          addToWishlist: () {
                            // Navigator.pushNamed(context, AppRoutes.profileRoute);
                            ref
                                .read(wishlistProvider.notifier)
                                .addProductToWishlist(productData[index]);
                          },
                          detailPageFunc: () {
                            Navigator.pushNamed(
                                context, AppRoutes.productDetailRoute,
                                arguments: productData[index]);
                          },
                        ),
                      );
                    },
                  ),

                  VSpace.large,

                  FadeInSlide(
                    duration: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.new_arrival,
                          style: AppTextStyle.headerFour.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: sizer(true, 18, context),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Get.to(() => ProductDetail());
                            Navigator.pushNamed(
                                context, AppRoutes.BestSellerPageRoute);
                          },
                          child: Text(AppLocalizations.of(context)!.view_all,
                              style: AppTextStyle.bodyTwo.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: sizer(true, 12, context))),
                        ),
                      ],
                    ),
                  ),

                  VSpace.large,
                  // large rectangle box with image of the shoe and name of the shoe and price best choice
                  FadeInSlide(
                    duration: 1.1,
                    child: SizedBox(
                      height: sizer(false, 130, context),
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: sizer(true, 20, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.best_seller,
                                    style: AppTextStyle.bodyThree.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  // VSpace.small,
                                  Text(
                                    'Nike Air Max',
                                    style: AppTextStyle.bodyFive.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: sizer(true, 18, context)),
                                  ),
                                  VSpace.small,
                                  Text(
                                    '£280',
                                    style: AppTextStyle.bodyFour.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: sizer(true, 15, context)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/images/nike.png',
                                width: sizer(true, 100, context),
                                height: sizer(false, 100, context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // style: Styles.themeData(themeChangeProvider.darkTheme, context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeLanguage(Locale? locale) {
    setState(() {
      log("Language changed to ${locale!.languageCode}");
    });
    // Update the locale using the provider
    // ref.read(localeProvider.notifier).state = locale;
  }
}
