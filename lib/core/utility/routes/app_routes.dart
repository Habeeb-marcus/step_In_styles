import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:step_in_style/core/utility/dialog_helper/dialog_manager.dart';
import 'package:step_in_style/models/product_card.dart';
import 'package:step_in_style/presentation/views/best_seller_page.dart';
import 'package:step_in_style/presentation/views/bottomAppBarPages/favorite_page.dart';
import 'package:step_in_style/presentation/views/cart/cart.dart';
import 'package:step_in_style/presentation/views/checkout/checkout.dart';
import 'package:step_in_style/presentation/views/notification.dart';
import 'package:step_in_style/presentation/views/authentication/forgot_password.dart';
import 'package:step_in_style/presentation/views/bottomAppBarPages/home_screen.dart';
import 'package:step_in_style/presentation/views/authentication/onboarding/onboarding_view.dart';
import 'package:step_in_style/presentation/views/authentication/otp_screen.dart';
import 'package:step_in_style/presentation/views/authentication/sign_in/sign_In.dart';
import 'package:step_in_style/presentation/views/authentication/sign_up/sign_up.dart';
import 'package:step_in_style/presentation/views/dashboard/dashboard.dart';
import 'package:step_in_style/presentation/views/products/product_detail.dart';
import 'package:step_in_style/presentation/views/profile.dart';

import '../../../presentation/views/authentication/verify_account_page.dart';

class AppRoutes {
  static const String loginRoute = "SignIn";
  static const String forgotPasswordRoute = "ForgotPassword";
  static const String verifyAccountRoute = "verifyAccountRoute";
  static const String otpScreenRoute = "otpScreen";
  static const String signUpRoute = "SignUp";
  static const String homeRoute = "HomeScreen";
  static const String dashboardRoute = "dashboardRoute";
  static const String onboardingRoute = "OnboardingView";
  static const String productDetailRoute = "productDetail";
  static const String notificationPageRoute = "notificationPage";
  static const String CheckoutPageRoute = "CheckoutPage";
  static const String BestSellerPageRoute = "BestSellerPage";
  static const String profileRoute = "profilePage";
  static const String CartPageRoute = "CartPage";
  static const String favoritePageRoute = "favoritePage";

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case homeRoute:
      //   return _getPageRoute(
      //     routeName: settings.name!,
      //     viewToShow: HomeScreen(title: 'Step In Style',),
      //   );

      case homeRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const HomeScreen(
            title: 'Step In Style',
          ),
        );

      case onboardingRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const OnboardingView(),
        );
      case loginRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.bottomToTop,
          routeName: settings.name!,
          viewToShow: const SignIn(),
        );

      case notificationPageRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.leftToRightWithFade,
          routeName: settings.name!,
          viewToShow: const NotificationPage(),
        );
      case signUpRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const SignUp(),
        );
      case productDetailRoute:
        final ProductCard data = settings.arguments as ProductCard;
        // final data = jsonDecode(settings.arguments as String);
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: ProductDetail(
            imageModel: data.image_model!,
            productName: data.title,
            price: data.price,
            description: data.description,
            productData: data,
          ),
        );
      case dashboardRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const DashBoard(),
        );

      case forgotPasswordRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const ForgotPassword(),
        );

      case verifyAccountRoute:
        String data = settings.arguments as String;

        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: VerifyAccountPage(data),
        );
      case otpScreenRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const OtpScreen(),
        );
      case CartPageRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const CartPage(),
        );
      case profileRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const ProfilePage(),
        );
      case CheckoutPageRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const CheckoutPage(),
        );
      case favoritePageRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const FavoritePage(),
        );
      case BestSellerPageRoute:
        return _getTransitionPageRoute(
          type: PageTransitionType.rightToLeft,
          routeName: settings.name!,
          viewToShow: const BestSellerPage(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  PageRoute _getPageRoute(
      {required String routeName, required Widget viewToShow}) {
    return MaterialPageRoute(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => DialogManager(child: viewToShow));
  }

  PageRoute _getTransitionPageRoute({
    required String routeName,
    required Widget viewToShow,
    PageTransitionType type = PageTransitionType.bottomToTop,
  }) {
    return PageTransition(
        settings: RouteSettings(
          name: routeName,
        ),
        type: type,
        child: DialogManager(child: viewToShow));
  }
}
