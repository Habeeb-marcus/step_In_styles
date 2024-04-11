import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';


class FullButton extends StatefulWidget {
  final Function? buttonFunction;
  final String? buttonText;
  final bool online, isTextSmall, isloading;
  final bool isIcon;
  final String? iconAsset;
  final Color? buttonOnlineColor, onlineTextColor;

  const FullButton(
      {super.key,
      required this.buttonFunction,
      this.buttonText,
      this.isloading = false,
      this.online = true,
      this.buttonOnlineColor,
      this.onlineTextColor,
      this.isIcon = false,
      this.iconAsset,
      this.isTextSmall = false});

  @override
  _FullButtonState createState() => _FullButtonState();
}

class _FullButtonState extends State<FullButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: widget.online
              ? widget.buttonFunction != null
                  ? () {
                      HapticFeedback.lightImpact();
                      widget.buttonFunction!();
                    }
                  : () {
                      HapticFeedback.lightImpact();
                    }
              : null,
          child: Container(
            height: sizer(false, 56, context),
            margin: const EdgeInsets.symmetric(vertical: 0.0),
            decoration: BoxDecoration(
                color: widget.isIcon == true
                        ?AppColors.white:
                widget.online
                    ? (widget.buttonOnlineColor ?? AppColors.primary)
                    :  AppColors.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: widget.isloading == true
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white),
                      )
                    : 
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                      widget.isIcon == true
                          ? Image.asset(widget.iconAsset ?? '',
                              height: sizer(false, 24, context),
                              width: sizer(true, 24, context))
                          : Container(),
                         widget.isIcon == true? HSpace.medium : Container(),
                     Text(widget.buttonText ?? '',
                        style: TextStyle(
                            color:
                                widget.isIcon == true ? AppColors.black3 :
                                     widget.online == true
                                ? (widget.onlineTextColor ?? Colors.white): AppColors.white,
                            fontSize: widget.isTextSmall == true
                                ? sizer(true, 14, context)
                                : sizer(true, 16, context),
                            fontWeight: FontWeight.w700)),
                   ],
                 )),
          ),
        ));
  }
}
