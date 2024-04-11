import 'package:flutter/material.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // infinity width
      width:  MediaQuery.of(context).size.width,
      padding:EdgeInsets.symmetric(vertical:  sizer(true, 15, context), horizontal: sizer(true, 20, context),),
      // height: sizer(false, 50, context),  
      color: AppColors.greyBackground,
      child: Row(
        children: [
          SizedBox(
            width: sizer(true, 40, context),
            height: sizer(false, 40, context),
            child: IconButton.filled(
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
          ),
        ],
      ),
    );
  }
}

