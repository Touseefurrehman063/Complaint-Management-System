import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTicketSearchField extends StatefulWidget {
  final TextEditingController controller;

  final bool isObsecure;

  final bool enable;

  const CustomTicketSearchField({
    Key? key,
    required this.controller,
    this.isObsecure = false,
    this.enable = true,
  }) : super(key: key);

  @override
  State<CustomTicketSearchField> createState() =>
      _CustomTicketSearchFieldState();
}

class _CustomTicketSearchFieldState extends State<CustomTicketSearchField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.8,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Get.width * 0.15)),
          elevation: 15,
          shadowColor: ColorManager.kGreyColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: ColorManager.kblackColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.09),
                    child: TextField(
                      enabled: widget.enable,
                      cursorColor: Colors.black,
                      controller: widget.controller,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(bottom: Get.height * 0.01),
                        hintText: "EnteryourticketID".tr,
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ColorManager.kblackColor,
                        ),

                        // prefix:
                        // Row(

                        // SizedBox(
                        //   width: Get.width * 0.15,
                        // ),
                        //     Text(
                        //       "Enter your ticket ID",
                        //       style: GoogleFonts.poppins(
                        //         fontSize: 12,
                        //         color: ColorManager.kblackColor,
                        //       ),
                        //     )
                        //   ],
                        // ),

                        fillColor: ColorManager.kblackColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Get.height * 0.5),
                          borderSide: const BorderSide(
                            color: ColorManager.kWhiteColor,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Get.height * 0.5),
                          borderSide: const BorderSide(
                            color: ColorManager.kWhiteColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Get.height * 0.5),
                          borderSide: const BorderSide(
                            color: ColorManager.kWhiteColor,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Get.height * 0.5),
                          borderSide: const BorderSide(
                            color: ColorManager.kWhiteColor,
                          ),
                        ),
                      ),
                      obscureText: widget.isObsecure,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
