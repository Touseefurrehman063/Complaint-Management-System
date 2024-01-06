import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTicketContainerRow extends StatelessWidget {
  late Color color;
  late String name;
  late String count;
  CustomTicketContainerRow(
      {required this.color,
      required this.name,
      required this.count,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Get.width * 0.2,
          height: Get.height * 0.08,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Get.width * 0.03),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                    fontSize: 9,
                    color: ColorManager.kWhiteColor,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                count,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: ColorManager.kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: Get.width * 0.02,
        ),
      ],
    );
  }
}
