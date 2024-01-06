import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final bool? obscureText;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? readOnly;
  final ValueChanged<String>? onChangedwidget;
  final int? maxlines;
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChangedwidget,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.readOnly,
    this.formatters,
    this.obscureText,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12,
        color: ColorManager.kGreyColor,
      ),
      maxLines: maxlines ?? 1,
      onChanged: onChangedwidget,
      obscureText: obscureText ?? false,
      inputFormatters: formatters,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorManager.kRedColor, fontSize: 12),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: hintText,
        hintStyle:
            GoogleFonts.poppins(color: ColorManager.kGreyColor, fontSize: 12),
        disabledBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.kRedColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorManager.kGreyColor)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.kGreyColor),
        ),
      ),
    );
  }
}
