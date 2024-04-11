import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';


class CustomToast extends StatelessWidget {
  final bool? Error ;

  // bool? Error = false;
  const CustomToast({super.key, required this.text,  this.Error});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: Error == false ? Colors.red : AppColors.primary,
          width: 1.0,
        ),
        color: Error == false ? Colors.red : AppColors.black2,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Error == false ? Icons.cancel : Icons.check_circle_outline,
              color: Error == false ? Colors.red : AppColors.primary,
              size: sizer(true, 20.0, context),
            ),
          ),
          SizedBox(
            width: sizer(true, 16.0, context),
          ), 

          Text(
            text,
            style: TextStyle(
                height: sizer(true, 1.4, context),
                color: AppColors.black3,
                fontSize: sizer(true, 13.0, context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
