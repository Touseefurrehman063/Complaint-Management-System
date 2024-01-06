import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

ticketAlert(BuildContext context) {
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) =>
        StatefulBuilder(builder: (context, newState) {
      return AlertDialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          content: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                Images.alertBackground,
              ),
            )),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.9,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Get.height * 0.03,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            Images.redCross,
                            scale: 2.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ticket ID : '.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: ColorManager.kblackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.3,
                        child: Text(
                          '0311010003110100031101000311010003110100'.tr,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: ColorManager.kblackColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Created Date & Time'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorManager.kblackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '23 Dec,2023 | 09:00AM'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorManager.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  // const Spacer(),
                  SizedBox(
                    height: Get.height * 0.57,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.08,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Department'.tr,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Laboratory '.tr,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Sub Department'.tr,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Nematology '.tr,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Category'.tr,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Support '.tr,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.01,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Priority'.tr,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'High Laboratory Laboratory Laboratory Laboratory Laboratory Laboratory Laboratory Laboratory Laboratory Laboratory '
                                          .tr,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'Subject'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: ColorManager.kWhiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Export Not Working '.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: ColorManager.kWhiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            'Description'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: ColorManager.kWhiteColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'
                                .tr,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: ColorManager.kWhiteColor,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Status: '.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: ColorManager.kWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: Get.width * 0.015,
                      ),
                      MyButton(
                          buttonheight: Get.height * 0.03,
                          text: "In Progress",
                          backgroundColor: ColorManager.kPrimaryinprogressColor,
                          buttonwidth: Get.width * 0.2,
                          onPress: () {},
                          textColor: ColorManager.kWhiteColor,
                          radius: Get.width * 0.03,
                          textfontsize: 10),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Images.chatIcon,
                          scale: 2.5,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Images.imageIcon,
                          scale: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                  ),
                ],
              ),
            ),
          ));
    }),
  );
}
