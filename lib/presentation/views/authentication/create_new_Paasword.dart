import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/core/components/custom_toast.dart';
import 'package:step_in_style/core/components/general_textfield.dart';
import 'package:step_in_style/core/utility/regex.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final _formKeyEmail = GlobalKey<FormState>();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  bool isButtonActive = false;

  String? confirmPasswordValidator(String? value) {
    if (passwordEditingController.text != value) {
      return "Password does not match";
    }
    return null;
  }

  showCustomToast(Error) {
    fToast.showToast(
      child: const CustomToast(text: "Password does not match", Error: false),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 5),
    );
  }



  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        resizeToAvoidBottomInset: true,
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
                    top: sizer(true, 40, context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const AuthenticationHeader(),
                    InkWell(
                      child: Image.asset(
                        'assets/icons/back.png',
                        height: 40,
                        width: 40,// Adjust the height as needed
                      ),
                      onTap: () {
                        // Call Navigator.pop() to go back to the previous screen
                        Navigator.pop(context);
                      },
                    ),SizedBox(
                      height: sizer(false, 10, context),
                    ),
                    Text(
                      "Create New Password",
                      style: TextStyle(
                          fontSize: sizer(true, 24, context),
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary),
                    ),
                    Text(
                      "Please, enter a new password below different from the previous password",
                      style: TextStyle(
                          fontSize: sizer(true, 14, context),
                          fontWeight: FontWeight.w400,
                          color: AppColors.black2),
                    ),


                    SizedBox(
                      height: sizer(false, 10, context),
                    ),
                    GeneralTextField(
                      textController: passwordEditingController,
                      hintText: "New password",
                      validator: passwordVal,
                      obscureText: obscurePassword,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (val){
                        setState(() {
                          isButtonActive =  passwordEditingController.text.length >= 6 &&
                              confirmPasswordEditingController.text.length >= 6 &&
                              confirmPasswordEditingController.text.length ==
                                  passwordEditingController.text.length;
                        });
                      },
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
                          color: AppColors.black2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizer(false, 10, context),
                    ),
                    GeneralTextField(
                      textController: confirmPasswordEditingController,
                      hintText: "Confirm password",
                      validator: (val) {
                        if (
                        passwordEditingController.text !=  confirmPasswordEditingController.text) {
                          return "Password don't match";
                        }
                        return null;
                      },
                      obscureText: obscureConfirmPassword,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (val) {
                        setState(() {
                          isButtonActive =  passwordEditingController.text.length >= 6 &&
                              confirmPasswordEditingController.text.length >= 6 &&
                              confirmPasswordEditingController.text.length ==
                                  passwordEditingController.text.length;
                        });
                        print('WWWWWWWW W$isButtonActive');
                      },
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: sizer(true, 24, context),
                          color: AppColors.black2,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.38,
                    ),
                    FullButton(
                        buttonFunction: () {
                          isButtonActive == true ? Navigator.pushNamed(context, AppRoutes.loginRoute) : (){};
                        },
                        buttonText: 'Create new password',
                        online: isButtonActive

                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );  }
}
