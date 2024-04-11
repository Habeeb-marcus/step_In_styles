import 'dart:async';

import 'package:flutter/material.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart';
import 'package:step_in_style/core/components/pin_textfield.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';
  TextEditingController otpEditingController = TextEditingController();
  bool _isloading = false;


  @override
  void initState() {
    super.initState();
    // Delayed execution to ensure the build context is available.
    // SchedulerBinding.instance.addPostFrameCallback((_) => _showTokenDialog());
  }

  // void _showTokenDialog() {
  //   // final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false, // Set to true if you want to close the dialog by tapping outside of it.
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Your Token'),
  //         content: SelectableText(userProvider.token ?? 'No token available'),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () {
  //               if (userProvider.token != null) {
  //                 Clipboard.setData(ClipboardData(text: userProvider.token));
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   SnackBar(
  //                     content: Text('Token copied to clipboard!'),
  //                   ),
  //                 );
  //               }
  //               Navigator.of(context).pop(); // Close the dialog
  //             },
  //             child: Text('Copy'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Timer? _timer; // Declare a Timer variable
  int counter = 30; // Initial value of the counter

  void startTimer() {
    // Reset the counter to 30 seconds
    counter = 30;

    // If there's an existing timer, cancel it
    _timer?.cancel();

    // Create a new timer
    _timer = Timer.periodic(const Duration(seconds: 01), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          // When counter reaches 0, cancel the timer
          timer.cancel();
          counter = 30;
        }
      });
    });
  }

  @override
  void dispose() {
    otpEditingController.dispose();
    _timer?.cancel();
    // focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<UserProvider>(context, listen: false);

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
                    onPressed: (){
                         Navigator.pop(context);
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
                 VSpace.medium,
                  Text(
                    "Verify it’s you",
                    style: TextStyle(
                        fontSize: sizer(true, 24, context),
                        fontWeight: FontWeight.w600,
                        color: AppColors.black2),
                  ),
                  Text(
                    "We send a code to ( *****@mail.com ). Enter it here to verify your identity",
                    style: TextStyle(
                        fontSize: sizer(true, 14, context),
                        fontWeight: FontWeight.w400,
                        color: AppColors.black2),
                  ),
                  SizedBox(
                    height: sizer(false, 32, context),
                  ),
                  Center(
                    child: PinTextInput(
                      pinEditingController: otpEditingController,
                
                      onChanged: (text) {
                        setState(() {
                          _otp = text ?? '';
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: sizer(false, 16, context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          startTimer();
                        },
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            fontSize: sizer(true, 14, context),
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: sizer(true, 8, context),
                            vertical: sizer(false, 4, context)),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '00:${counter.toString().padLeft(2, '0')}s',
                          style: TextStyle(
                            fontSize: sizer(true, 14, context),
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: sizer(false, 30, context),
                  ),
                 FullButton(
  buttonFunction: () async {
    if (otpEditingController.text.length == 5) {
      setState(() {
        _isloading = true;
      });
      const email ='' ;
      // authProvider.email;
      const token = '';
      // authProvider.token;
      // print(']]]]]]]]]]the email is $email and the token is $token');
      // bool emailVerified = await authProvider.verifyEmail(email, token, context);
      // print('the verified response >>>>>>>> $emailVerified  ')  ;

      if (true) {
        // Navigator.pushNamed(context, RouteHelper.IDScreenRoute);
      } else {
        // Handle the case where email is not verified.
        // You might want to show an error message to the user here.
        print('Verification failed. Please check the OTP and try again.');
      }
    } else {
      // Handle the case where OTP length is not 5.
      // You might want to show an error message or indicator to the user.
      print('Please enter a valid OTP');
    }
    setState(() {
      _isloading = false;
    });
  },
  buttonText: 'Confirm', // As your condition was always true, simplified it
  online: otpEditingController.text.length == 5,
  isloading: _isloading,
)


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
