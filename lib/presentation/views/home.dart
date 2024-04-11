import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/language/language.dart';
import 'package:step_in_style/core/utility/darkmode/dark_theme_provider.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/themes/theme_styles.dart';
import 'package:step_in_style/presentation/views/authentication/auth_checker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'dart_tool/flutter_gen/gen_l10n/app_localizations.dart';



class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, });


  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>  with WidgetsBindingObserver{
  // DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  // final FlutterLocalization localization = FlutterLocalization.instance;
  bool isBackground = false;


    @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        getCurrentAppTheme();
        //  configureLocalization();
      },
    );
  }


   void getCurrentAppTheme() async {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    print('brightness: $brightness');
    bool isDarkMode = brightness == Brightness.dark;
    ref.read(themeProvider).setDarkTheme = isDarkMode ;
  }


  // void onTranslatedLanguage(Locale? locale) {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(themeProvider);
    final language = ref.watch(languageProvider);
    // initialize firbase for authentication ina the main.dart file
    // Firebase.initializeApp();

  return MaterialApp(
      theme: Styles.themeData(provider.darkTheme, context),
      home: const AuthChecker(),
      builder: EasyLoading.init(),
      onGenerateRoute: AppRoutes().generateRoute,
      debugShowCheckedModeBanner: false,
      color: AppColors.greyBackground,
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language.code),
    );

  }
}


