import 'package:api_testing/utils/color.dart';
import 'package:api_testing/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final double? height;

  final List<TextInputFormatter>? inputFormatters;
  final bool showBorder;
  final bool? readOnly;
  final void Function()? onTap;
  final Color? borderColor;
  final Widget? prefixIcon;
  final List<BoxShadow>? boxShadow;
  final Color? decorationColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Color? fillColor;
  final double? borderRadius;
  final bool enabledborder;
  final bool focuesdborder;
  final TextInputAction? textInputAction;
  final bool border;

  const CommonTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.height,
    required this.hintText,
    this.boxShadow,
    this.readOnly,
    this.onTap,
    this.decorationColor,
    this.textInputAction,
    this.borderRadius,
    this.inputFormatters,
    this.showBorder = true,
    this.borderColor,
    this.keyboardType,
    this.fillColor,
    this.enabledborder = true,
    this.focuesdborder = true,
    required this.border,
    this.prefixIcon,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        boxShadow: boxShadow,
        color: decorationColor,
      ),
      height: height ?? 50,
      child: TextField(
        style: MyTexts.medium16,
        maxLines: maxLines,
        readOnly: readOnly ?? false,
        controller: controller,
        obscureText: obscureText,
        onTap: onTap,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(horizontal: 3.w,),
          prefixIcon: prefixIcon,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: MyTexts.medium16.copyWith(
            color: const Color(0xFF8B919E),
          ),
          border: showBorder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF8B919E),
            ),
          )
              : InputBorder.none,
          focusedBorder: focuesdborder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF8B919E),
            ),
          )
              : InputBorder.none,
          enabledBorder: enabledborder
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFF8B919E),
            ),
          )
              : InputBorder.none,
        ),
      ),
    );
  }
}

class CommonDropDown extends StatelessWidget {
  final List<String> list;
  final String val;
  final void Function(String?)? onChange;

  const CommonDropDown({super.key, required this.list, required this.val, this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.grey),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                  color: MyColors.grey,
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(12.0),
            items: list.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: MyTexts.medium16,
                ),
              );
            }).toList(),
            value: val,
            onChanged: onChange,
          ),
        ),
      ),
    );
  }
}
