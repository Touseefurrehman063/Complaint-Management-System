import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterCustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final int? maxlines;
  final Widget? prefixIcon;
  final TextStyle? suffixStyle;
  final String? suffixText;
  final bool? isSizedBoxAvailable;
  final bool readonly;
  final Color? fillColor;
  final Widget? suffixIcon;
  final String? hintText;
  final Function(String)? onchanged;
  const RegisterCustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.fillColor = ColorManager.kPrimaryLightColor,
    this.readonly = false,
    this.isSizedBoxAvailable = true,
    this.suffixText,
    this.suffixStyle,
    this.prefixIcon,
    this.maxlines,
    this.padding,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.onchanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          controller: controller,
          onChanged: onchanged,
          validator: validator,
          onTap: onTap ?? () {},
          maxLines: maxlines ?? 1,
          readOnly: readonly,
          style: GoogleFonts.poppins(
              color: ColorManager.kblackColor, fontSize: 12),
          decoration: InputDecoration(
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorManager.kRedColor, fontSize: 12),
            contentPadding:
                padding ?? const EdgeInsets.symmetric(horizontal: 20),
            hintStyle: GoogleFonts.poppins(color: ColorManager.kGreyColor),
            hintText: hintText,
            filled: true,
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: ColorManager.kGreyColor),
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.kRedColor)),
            fillColor: ColorManager.kWhiteColor,
            suffixIcon: IconButton(
                onPressed: onTap ?? () {}, icon: Image.asset(Images.dropdown)),
            suffixText: suffixText,
            suffixStyle: suffixStyle,
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.kPrimaryLightColor),
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
            ),
          ),
          inputFormatters: inputFormatters,
        ),
        isSizedBoxAvailable == true
            ? SizedBox(
                height: Get.height * 0.02,
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
