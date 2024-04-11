import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/core/components/onboarding_content.dart';
import 'package:step_in_style/core/utility/routes/app_routes.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/models/onboarding_data.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Spacing.spacingL, vertical: Spacing.spacingN),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // skip button
                
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView.builder(
                        controller: _controller,
                        onPageChanged: (value) {
                          setState(() {
                            currentIndex = value;
                          });
                        },
                        itemCount: onboardingData.length,
                        itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OnboardingContent(
                                title: onboardingData[index].title,
                                imageSrc: onboardingData[index].imageSrc,
                                description: onboardingData[index].description,
                                dataLength: onboardingData.length,
                                currentIndex: index.toDouble(),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
               VSpace.large,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: onboardingData.length,
                        effect: const ExpandingDotsEffect(
                            spacing: 4.0,
                            expansionFactor: 3,
                            radius: 50,
                            dotWidth: 14.0,
                            dotHeight: 7.0,
                            strokeWidth: 10,
                            dotColor: AppColors.lightGrey,
                            activeDotColor: AppColors.primary),
                      ),
                    ),
                    SizedBox(
                      width: sizer(false, 165, context),
                      child: FullButton(
                        buttonFunction: () {
                          currentIndex == 2
                              ? Navigator.pushNamed(context, AppRoutes.signUpRoute)
                              :
                               _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              
                          
                        },
                        buttonText: currentIndex == 0 ?'Get Started': 'Next' 
                        ,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    ));
  }
}
