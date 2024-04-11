import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:step_in_style/core/utility/constants.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';

void configEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 20000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Constants.prmaryWhite
    ..backgroundColor = AppColors.primary
    ..indicatorColor = Constants.prmaryWhite
    ..textColor = Constants.prmaryWhite
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = _CustomAnimation();
}

class _CustomAnimation extends EasyLoadingAnimation {
  _CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
