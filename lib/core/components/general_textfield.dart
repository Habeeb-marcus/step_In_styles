import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';

class GeneralTextField extends StatelessWidget {
  final String? hintText;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final double? fontSize;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool multiline;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String?)? validator;
  final Widget? prefixIcon, suffixIcon;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  const GeneralTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textController,
    this.textCapitalization,
    this.onSaved,
    this.fontSize,
    this.validator,
    this.textAlignVertical,
    this.strutStyle,
    this.autoValidateMode,
    this.multiline = false,
    this.inputFormatters,
    this.maxLength,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxLength,

      textCapitalization: textCapitalization ?? TextCapitalization.none,
      controller: textController ?? controller,
      onSaved: onSaved,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center, // textAlignVertical,
      autovalidateMode: autoValidateMode,
      maxLines: multiline ? 4 : 1,
      minLines: multiline ? 4 : 1,
      cursorHeight: sizer(true, 20.0, context),
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: AppColors.black2,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? sizer(true, 16, context)),
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        counter: const Offstage(),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            vertical: sizer(false, 16, context),
            horizontal: sizer(true, 20, context)),
        fillColor: AppColors.white,
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          color: AppColors.textGray,
          fontFamily: 'SFProDisplay',
          fontSize: fontSize ?? sizer(true, 14, context),
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sizer(true, 12, context)),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.primary,
          ),
        ),
        errorStyle: TextStyle(fontSize: sizer(true, 12, context)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(sizer(true, 12, context)),
          borderSide: const BorderSide(
            width: 0.5, color: AppColors.white,
            //  style: BorderStyle.none,
          ),
        ),
        filled: true,
      ),

      //autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator ??
          (val) {
            if ((val?.length ?? 0) == 0) {
              return "${hintText ?? "Field"} is required";
            } else {
              return null;
            }
          },
    );
  }
}
