import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/providers/auth_provider.dart';
import 'package:step_in_style/presentation/views/authentication/sign_in/sign_In.dart';
import 'package:step_in_style/presentation/views/dashboard/dashboard.dart';

import '../../../core/utility/user_data_provider.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final user = ref.watch(userProvider).user;
    final isVerified = user != null && (user.isVerified ?? false);
    return authState.when(
        data: (value) {
          log('User: $value');
          log('isVerified: $isVerified');
          if (value != null && isVerified) {
            return const DashBoard();
          }
          return const SignIn();
        },
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        error: (error, stackTrace) => const SignIn());
  }
}
