import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final localeProvider = StateProvider<Locale>((ref) {
  // Set the initial locale as English
  return const Locale('en', '');
});
