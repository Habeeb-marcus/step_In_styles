import 'dart:developer';

import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:step_in_style/core/providers/auth_provider.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/models/users_model.dart';

import '../../../core/components/buttons/full_button.dart';
import '../../../core/utility/shared_prefs.dart';
import '../../../core/utility/size_calculator.dart';
import '../../styles/app_colors.dart';
import '../../styles/spacings.dart';

class VerifyAccountPage extends ConsumerStatefulWidget {
  final String email;
  const VerifyAccountPage(this.email, {super.key});

  @override
  ConsumerState<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends ConsumerState<VerifyAccountPage> {
  late OtpFieldController _otpController;
  EmailOTP myAuth = EmailOTP();
  bool isVerified = false;
  final duration = const Duration(seconds: 3);

  @override
  void initState() {
    _otpController = OtpFieldController();

    Future.delayed(Duration.zero, () async {
      EasyLoading.show(status: 'Loading');
      myAuth.setConfig(
        appEmail: "h.makusota@gmail.com",
        appName: "Step In Style",
        userEmail: widget.email,
        otpLength: 5,
        otpType: OTPType.digitsOnly,
      );
      myAuth.setTheme(theme: "v3");
      myAuth.sendOTP().then((value) {
        EasyLoading.dismiss();
        if (value) {
          EasyLoading.showInfo('OTP sent!', duration: duration);
        } else {
          EasyLoading.showError('Could\'nt send OTP', duration: duration);
        }
      }).catchError((e) {
        log(e.toString());
        EasyLoading.dismiss();
        EasyLoading.showError('An error occurred', duration: duration);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // canPop: true,
    // onPopInvoked: (didPop) {
    //   if (didPop) {
    //     Navigator.of(context).pushNamedAndRemoveUntil(
    //         AppRoutes.loginRoute, ModalRoute.withName(AppRoutes.loginRoute));
    //   }
    // },
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
        child: Padding(
          padding: EdgeInsets.only(
              left: sizer(true, 16, context),
              right: sizer(true, 16, context),
              top: sizer(true, 20, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton.filled(
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //     AppRoutes.loginRoute,
                    //     ModalRoute.withName(AppRoutes.loginRoute));
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(AppColors.white),
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
                "Email Verification",
                style: TextStyle(
                    fontSize: sizer(true, 24, context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black2),
              ),
              Text(
                "An OTP will be sent to your email.",
                style: TextStyle(
                    fontSize: sizer(true, 14, context),
                    fontWeight: FontWeight.w400,
                    color: AppColors.black2),
              ),
              VSpace.medium,
              OTPTextField(
                controller: _otpController,
                length: 5,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 45,
                spaceBetween: 8,
                style: const TextStyle(fontSize: 17, color: AppColors.Bblack),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 15,
                onChanged: (_) {},
                onCompleted: (pin) async {
                  log("Completed: $pin");
                  setState(() {
                    isVerified = myAuth.verifyOTP(otp: pin);
                  });
                  if (isVerified) {
                    EasyLoading.showInfo('Email Verified!', duration: duration);
                  }
                },
              ),
              SizedBox(
                height: sizer(false, 80, context),
              ),
              FullButton(
                buttonFunction: () {
                  if (isVerified) {
                    ref
                        .watch(
                            verifyEmailProvider.call(SharedPrefs.user!).future)
                        .then((value) {
                      log(value.toString());
                      SharedPrefs.user = value;
                      if (value != null) {
                        Navigator.of(context).pop();
                        // Navigator.of(context)
                        //     .pushReplacementNamed(AppRoutes.loginRoute);
                      }
                    });
                  }
                },
                buttonText: 'Go and sign in',
                online: isVerified,
              ),
              SizedBox(
                height: sizer(false, 20, context),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
