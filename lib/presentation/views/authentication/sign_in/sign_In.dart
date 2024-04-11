import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/core/components/general_textfield.dart';
import 'package:step_in_style/core/providers/auth_provider.dart';
import 'package:step_in_style/core/utility/regex.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/animations/fade_in_slide.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';

import '../../../../core/utility/user_data_provider.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  bool obscurePassword = true;
  final _formKeyEmail = GlobalKey<FormState>();
  String? _email;

  bool get areFieldsNotEmpty {
    return emailRegExMatch(emailEditingController.text) &&
        passwordEditingController.text.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    final userProv = ref.read(userProvider.notifier);
    var generalTextField = GeneralTextField(
      obscureText: obscurePassword,
      textController: passwordEditingController,
      hintText: 'Password',
      fontSize: sizer(true, 16, context),
      keyboardType: TextInputType.emailAddress,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: passwordVal,
      onChanged: (val) => setState(() {
        _email = val;
      }),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
        icon: Icon(
          obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: sizer(true, 24, context),
          color: AppColors.gray,
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.greyBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(sizer(true, 20, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VSpace.xLarge,
                      FadeInSlide(
                        duration: .4,
                        child: Text(
                          "Hi There! 👋",
                          style: AppTextStyle.headerOne.copyWith(
                              fontSize: sizer(true, 28, context),
                              fontFamily: 'SFProDisplay',
                              color: AppColors.black2),
                        ),
                      ),
                      FadeInSlide(
                        duration: .5,
                        child: Text(
                          "Welcome Back, You've Been Missed!",
                          style: TextStyle(
                              fontSize: sizer(true, 16, context),
                              fontWeight: FontWeight.w400,
                              color: AppColors.black3),
                        ),
                      ),
                      VSpace.large,
                      FadeInSlide(
                        duration: .6,
                        child: Text(
                          "Email Address",
                          style: TextStyle(
                              fontSize: sizer(true, 16, context),
                              fontWeight: FontWeight.w600,
                              color: AppColors.black2),
                        ),
                      ),
                      VSpace.small,
                      FadeInSlide(
                        duration: .7,
                        child: GeneralTextField(
                          key: _formKeyEmail,
                          focusNode: emailFocusNode,
                          textInputAction: TextInputAction.next,
                          textController: emailEditingController,
                          hintText: 'h.makusota@gmail.com',
                          fontSize: sizer(true, 16, context),
                          keyboardType: TextInputType.emailAddress,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: emailVal,
                          onChanged: (val) => setState(() {
                            _email = val;
                          }),
                        ),
                      ),
                      VSpace.medium,
                      FadeInSlide(
                        duration: .8,
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontSize: sizer(true, 16, context),
                              fontWeight: FontWeight.w600,
                              color: AppColors.black2),
                        ),
                      ),
                      VSpace.small,
                      FadeInSlide(duration: .9, child: generalTextField),
                      VSpace.tiny,
                      FadeInSlide(
                        duration: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.forgotPasswordRoute);
                              },
                              child: Text('Forgot Password?',
                                  style: TextStyle(
                                      fontSize: sizer(true, 14, context),
                                      color: AppColors.black3,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ),
                      VSpace.large,
                      FadeInSlide(
                        duration: 1.1,
                        child: FullButton(
                          buttonFunction: () async {
                            FocusScope.of(context).unfocus();
                            if (areFieldsNotEmpty) {
                              EasyLoading.show(status: 'Loading...');
                              ref
                                  .read(signInWithPasswordProvider
                                      .call(emailEditingController.text.trim(),
                                          passwordEditingController.text.trim())
                                      .future)
                                  .then((value) {
                                // ref.read()
                                EasyLoading.dismiss();
                                if (value != null) {
                                  userProv.setUser = value;
                                } else {
                                  EasyLoading.showError(
                                    'An error occurred!',
                                    duration: const Duration(seconds: 3),
                                  );
                                }
                              }).onError((e, st) {
                                log(e.toString());
                                log(st.toString());
                                EasyLoading.showError(
                                  e.toString(),
                                  duration: const Duration(seconds: 3),
                                );
                              });
    
                            }
                          },
                          buttonText: 'Sign In',
                          isIcon: false,
                          online: areFieldsNotEmpty,
                          isloading: false,
                        ),
                      ),
                      VSpace.medium,
                      FadeInSlide(
                        duration: 1.2,
                        child: FullButton(
                          buttonFunction: () async {
                            HapticFeedback.lightImpact();

                            EasyLoading.show(status: 'Loading...');
                            await ref
                                .read(signInWithGoogleProvider.future)
                                .then((value) {
                              EasyLoading.dismiss();
                              Navigator.of(context).pushNamed(AppRoutes.dashboardRoute);
                              if (value != null) {
                                userProv.setUser = value;
                              } else {
                                EasyLoading.showError(
                                  'An error occurred!',
                                  duration: const Duration(seconds: 3),
                                );
                              }
                              // Navigator.of(context)
                              //     .pushNamed(AppRoutes.dashboardRoute);
                            }).catchError((e) {
                              EasyLoading.dismiss();
                              EasyLoading.showError(e.toString(),
                                  duration: const Duration(seconds: 3));
                            });
                          },
                          isIcon: true,
                          iconAsset: 'assets/images/google.png',
                          buttonText: 'Sign In With Google',
                          online: true,
                          isloading: false,
                          onlineTextColor: AppColors.white,
                          buttonOnlineColor: AppColors.primary,
                        ),
                      ),
                      VSpace.xMassive,
                      FadeInSlide(
                        duration: 1.3,
                        child: Center(
                          child: RichText(
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                      fontSize: sizer(true, 15, context),
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.gray),
                                  children: [
                                TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(
                                      fontSize: sizer(true, 16, context),
                                      fontFamily: 'SPFProDisplay',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black2),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .pushNamed(AppRoutes.signUpRoute);
                                    },
                                )
                              ])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
