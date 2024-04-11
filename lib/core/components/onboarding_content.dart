
import 'package:flutter/material.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';


class OnboardingContent extends StatelessWidget {
  const OnboardingContent(
      {super.key,
      this.title,
      this.description,
      this.imageSrc,
      this.dataLength,
      this.currentIndex});
  final String? title, imageSrc, description;
  final int? dataLength;
  final double? currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
           children: [
             GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.signUpRoute);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: AppColors.black2,
                            fontSize: sizer(true, 15, context),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
           ],
         ),
        Padding(
          padding:  EdgeInsets.only(top: sizer(false, 20, context)),
          child: Center(
            child: Image.asset(
              imageSrc ?? '',
              fit: BoxFit.contain,
              height: sizer(false, 354, context),
              width: sizer(true, 385, context),
            ),
          ),
        ),
        Text(
          title ?? '',
          style:AppTextStyle.headerOne.copyWith(
            color: AppColors.black2,
            fontFamily: 'SFProDisplay',
        ),
        ),
        VSpace.medium,
        Padding(
          padding: EdgeInsets.only(right: sizer(true, 25, context)),
          child: Text(
            description ?? '',
            style: AppTextStyle.bodyFour.copyWith(
              color: AppColors.black3,
              fontFamily: 'SFProDisplay',
            ),
          ),
        ),
      ],
    );
  }
}
