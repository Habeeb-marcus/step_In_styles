import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/core/components/general_textfield.dart';
import 'package:step_in_style/core/providers/auth_provider.dart';
import 'package:step_in_style/core/utility/regex.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  const ForgotPassword({super.key});

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  TextEditingController emailEditingController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  final _formKeyEmail = GlobalKey<FormState>();
  String? _email;

  bool get areFieldsNotEmpty {
    return emailRegExMatch(emailEditingController.text);
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
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
              padding: EdgeInsets.only(
                  left: sizer(true, 16, context),
                  right: sizer(true, 16, context),
                  top: sizer(true, 20, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const AuthenticationHeader(),
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
                  VSpace.small,
                  Text(
                    "Passsword Recovery",
                    style: TextStyle(
                        fontSize: sizer(true, 24, context),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black2),
                  ),
                  Text(
                    "Enter your registered email below to receive password instructions",
                    style: TextStyle(
                        fontSize: sizer(true, 14, context),
                        fontWeight: FontWeight.w400,
                        color: AppColors.black2),
                  ),
                  VSpace.medium,
                  Form(
                    key: _formKeyEmail,
                    child: GeneralTextField(
                      focusNode: emailFocusNode,
                      textController: emailEditingController,
                      hintText: 'Enter your email address',
                      keyboardType: TextInputType.emailAddress,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: emailVal,
                      onChanged: (val) => setState(() {
                        _email = val;
                      }),
                    ),
                  ),

                  SizedBox(
                    height: sizer(false, 20, context),
                  ),
                  FullButton(
                      buttonFunction: () {
                        if (_formKeyEmail.currentState!.validate()) {
                          EasyLoading.show(status: 'Loading...');
                          ref
                              .read(sendRecoveryEmailProvider
                                  .call(emailEditingController.text.trim())
                                  .future)
                              .then((value) {
                            EasyLoading.dismiss();
                            EasyLoading.showInfo(
                              'A reset email has been sent to ${emailEditingController.text.trim()}',
                              duration: const Duration(seconds: 3),
                            );
                            Navigator.of(context).pop();
                          }).catchError((e) {
                            EasyLoading.showError(e.toString());
                          });
                        }

                        /// A rest link will be sent to the email that the
                        /// inputted. To achieve OTP I am afraid we will have
                        /// to use another backend other than firebase
                        // Navigator.pushNamed(context, AppRoutes.otpScreenRoute);
                        // areFieldsNotEmpty == true
                        //     ? Navigator.pushNamed(context,
                        //         AppRoutes.otpScreenRoute)
                        //     : () {};
                      },
                      buttonText: 'Send me email',
                      online: areFieldsNotEmpty),
                  SizedBox(
                    height: sizer(false, 20, context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
