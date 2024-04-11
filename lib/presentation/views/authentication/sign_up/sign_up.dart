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

import '../../../../core/utility/shared_prefs.dart';
import '../../../../core/utility/user_data_provider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  bool obscurePassword = true;
  bool isLoading = false;

  final _formKeyName = GlobalKey<FormState>();
  String? _email;

  bool get areFieldsNotEmpty {
    return emailRegExMatch(emailEditingController.text) &&
        passwordEditingController.text.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(
                sizer(true, 16, context),
              ),
              child: Form(
                key: _formKeyName,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const AuthenticationHeader(),
                    // icon button with white background
                    IconButton.filled(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.white),
                        ),
                        padding: const EdgeInsets.only(left: 8),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.black2,
                          size: sizer(true, 17,
                              context), // Assuming sizer is a function you've defined
                        )),

                    VSpace.large,

                    FadeInSlide(
                      duration: .4,
                      child: Text(
                        "Create Account",
                        style: AppTextStyle.headerOne.copyWith(
                            fontSize: sizer(true, 28, context),
                            fontFamily: 'SFProDisplay',
                            color: AppColors.black2),
                      ),
                    ),
                    FadeInSlide(
                      duration: .5,
                      child: Text(
                        "Let's create an account for you!",
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
                        "Your Name",
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
                        focusNode: nameFocusNode,
                        textInputAction: TextInputAction.next,
                        textController: nameEditingController,
                        hintText: 'Daniel Cunliffe ',
                        fontSize: sizer(true, 16, context),
                        keyboardType: TextInputType.emailAddress,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val) =>
                            ((val?.isEmpty ?? true) || (val?.length ?? 0) <= 3)
                                ? 'Enter a valid username'
                                : null,
                        onChanged: (val) => setState(() {
                          _email = val;
                        }),
                      ),
                    ),
                    VSpace.medium,

                    FadeInSlide(
                      duration: .8,
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
                      duration: .9,
                      child: GeneralTextField(
                        // key: _formKeyEmail,
                        focusNode: emailFocusNode,
                        textInputAction: TextInputAction.next,
                        textController: emailEditingController,
                        hintText: 'markware@gmail.com',
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
                      duration: 1,
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: sizer(true, 16, context),
                            fontWeight: FontWeight.w600,
                            color: AppColors.black2),
                      ),
                    ),
                    VSpace.small,
                    FadeInSlide(
                      duration: 1.1,
                      child: GeneralTextField(
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
                      ),
                    ),

                    VSpace.large,

                    FadeInSlide(
                      duration: 1.2,
                      child: FullButton(
                        buttonFunction: () async {
                          FocusScope.of(context).unfocus();
                          if (areFieldsNotEmpty &&
                              _formKeyName.currentState!.validate()) {
                            // authProvider.setIsLoading(true);
                            // final loggedInUser = await authProvider.login(emailEditingController.text, passwordEditingController.text,
                            //     context);
                            // if (loggedInUser == true) {
                            // authProvider.setIsLoading(false);
                            EasyLoading.show(status: 'Loading...');
                            ref
                                .watch(createAccountWithPasswordProvider
                                    .call(
                                      fullName:
                                          nameEditingController.text.trim(),
                                      email: emailEditingController.text.trim(),
                                      password:
                                          passwordEditingController.text.trim(),
                                    )
                                    .future)
                                .then((value) {
                              EasyLoading.dismiss();
                              if (value != null) {
                                SharedPrefs.user = value;
                                Navigator.of(context).popAndPushNamed(
                                  AppRoutes.verifyAccountRoute,
                                  arguments: emailEditingController.text.trim(),
                                );
                              }
                            }).catchError((e) {
                              EasyLoading.showError(
                                e.toString(),
                                duration: const Duration(seconds: 3),
                              );
                            });
                            // Navigator.pushNamed(context, AppRoutes.signUpRoute);
                            // } else {
                            //   print('wrong log in details');
                            // }
                          }
                        },
                        buttonText: 'Sign Up',
                        isIcon: false,
                        online: areFieldsNotEmpty,
                        isloading: false,
                      ),
                    ),
                    VSpace.medium,

                    FadeInSlide(
                      duration: 1.3,
                      child: FullButton(
                        buttonFunction: () async {
                          HapticFeedback.lightImpact();

                          EasyLoading.show(status: 'Loading...');
                          final userProv = ref.read(userProvider.notifier);
                          await ref
                              .read(signInWithGoogleProvider.future)
                              .then((value) {
                            EasyLoading.dismiss();
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

                    VSpace.massive,
                    FadeInSlide(
                      duration: 1.4,
                      child: Center(
                        child: RichText(
                            text: TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    fontSize: sizer(true, 15, context),
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.gray),
                                children: [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                    fontSize: sizer(true, 16, context),
                                    fontFamily: 'SPFProDisplay',
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black2),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.loginRoute);
                                  },
                              )
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
