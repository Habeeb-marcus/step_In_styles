import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:step_in_style/core/alerts/easy_loading_config.dart';
import 'package:step_in_style/core/language/language.dart';
import 'package:step_in_style/core/repository/langauge_repository.dart';
import 'package:step_in_style/core/utility/dialog_helper/dialog_handler.dart';
import 'package:step_in_style/presentation/views/home.dart';

import 'core/utility/shared_prefs.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().initSharedPrefs();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

//  widgets
  // initialize firebase
  // await Firebase.initializeApp( );
  // Initialize GetIt, the service locator for dependency injection
  final GetIt locator = GetIt.instance;
// Sets up the service locator and registers services and view models
  void setupLocator() {
    // Register a singleton instance of DialogHandler for global access
    locator.registerLazySingleton<DialogHandler>(() => DialogHandler());
    // Register other services or view models as needed here
  }
  final container = ProviderContainer();
  final language = await container.read(languageRepositoryProvider).getLanguage();

  setupLocator();
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding
          .ensureInitialized()); // Preserve native splash screen

  // Remove the splash screen after a delay (e.g., to wait for initial data loading)
  Future.delayed(const Duration(seconds: 5)).then((value) {
    FlutterNativeSplash
        .remove(); // Remove splash screen when initialization is complete
  });
  configEasyLoading();
  runApp( ProviderScope(
    overrides: [languageProvider.overrideWith((ref) => language)],
    child: const MyHomePage()));
}
