import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTickets extends StatelessWidget {
  late Color color;
  late String heading;
  late String subheading;
  late String priority;
  late String status;
  late String statuskey;
  CustomTickets(
      {required this.color,
      required this.heading,
      required this.subheading,
      required this.priority,
      required this.status,
      required this.statuskey,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorManager.kPrimarycardgreyColor,
            borderRadius: BorderRadius.circular(Get.height * 0.02),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.03, vertical: Get.height * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.1,
                  width: Get.width * 0.15,
                  child: InkWell(
                      onTap: () {},
                      child: Image.asset(statuskey == "inprogress"
                          ? Images.inprogresscardleading
                          : statuskey == "cancel"
                              ? Images.cancelcardleading
                              : statuskey == "pending"
                                  ? Images.pendingcardleading
                                  : statuskey == "completed"
                                      ? Images.completedcardleading
                                      : Images.completedcardleading)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: GoogleFonts.poppins(
                          fontSize: 8,
                          color: ColorManager.kPrimaryBlueColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      subheading,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ColorManager.kPrimaryBlueColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      priority,
                      style: GoogleFonts.poppins(
                          fontSize: 8,
                          color: ColorManager.kPrimaryBlueColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      status,
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: color,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.01,
        ),
      ],
    );
  }
}
