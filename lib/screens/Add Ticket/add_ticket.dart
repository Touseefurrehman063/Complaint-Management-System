import 'package:cms_application/components/custom_search_dropdown.dart';
import 'package:cms_application/components/custom_textfield.dart';
import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/controller/add_ticket.dart';
import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/screens/Dashboard/menu_drawer.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTickets extends StatefulWidget {
  const AddTickets({super.key});

  @override
  State<AddTickets> createState() => _AddTicketsState();
}

class _AddTicketsState extends State<AddTickets> {
  var ticketController = Get.put<AddTicketController>(AddTicketController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.kPrimaryBlueColor,
          onPressed: () {
            ProfileController.i.updateselectedPage(0);
            Get.offAll(() => const DrawerScreen());
          },
        ),
        title: Text(
          'AddTicket'.tr,
          style: GoogleFonts.poppins(
            textStyle: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ColorManager.kPrimaryBlueColor),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegisterCustomTextField(
                // validator: (value) {
                //   if (controller.selectedpersonalTitle == null) {
                //     return 'selectpersonaltitle'.tr;
                //   } else {
                //     return null;
                //   }
                // },
                onTap: () async {
                  // controller.selectedpersonalTitle = null;
                  // PTitle generic = await searchabledropdown(
                  //     context, controller.personalTitleList);
                  // controller.selectedpersonalTitle = null;
                  // controller.updateselectedpersonalTitle(generic);

                  // if (generic.id != null) {
                  //   controller.selectedpersonalTitle = generic;
                  //   controller.selectedpersonalTitle =
                  //       (generic.id == null)
                  //           ? null
                  //           : controller.selectedpersonalTitle;
                  // }
                },
                readonly: true,
                // hintText: controller.selectedpersonalTitle == null
                //     ? 'title'.tr
                //     : controller.selectedpersonalTitle!.name.toString(),
                hintText: "SelectDepartment".tr,
              ),
              RegisterCustomTextField(
                // validator: (value) {
                //   if (controller.selectedpersonalTitle == null) {
                //     return 'selectpersonaltitle'.tr;
                //   } else {
                //     return null;
                //   }
                // },
                onTap: () async {
                  // controller.selectedpersonalTitle = null;
                  // PTitle generic = await searchabledropdown(
                  //     context, controller.personalTitleList);
                  // controller.selectedpersonalTitle = null;
                  // controller.updateselectedpersonalTitle(generic);

                  // if (generic.id != null) {
                  //   controller.selectedpersonalTitle = generic;
                  //   controller.selectedpersonalTitle =
                  //       (generic.id == null)
                  //           ? null
                  //           : controller.selectedpersonalTitle;
                  // }
                },
                readonly: true,
                // hintText: controller.selectedpersonalTitle == null
                //     ? 'title'.tr
                //     : controller.selectedpersonalTitle!.name.toString(),
                hintText: "SelectSubDepartment".tr,
              ),
              RegisterCustomTextField(
                // validator: (value) {
                //   if (controller.selectedpersonalTitle == null) {
                //     return 'selectpersonaltitle'.tr;
                //   } else {
                //     return null;
                //   }
                // },
                onTap: () async {
                  // controller.selectedpersonalTitle = null;
                  // PTitle generic = await searchabledropdown(
                  //     context, controller.personalTitleList);
                  // controller.selectedpersonalTitle = null;
                  // controller.updateselectedpersonalTitle(generic);

                  // if (generic.id != null) {
                  //   controller.selectedpersonalTitle = generic;
                  //   controller.selectedpersonalTitle =
                  //       (generic.id == null)
                  //           ? null
                  //           : controller.selectedpersonalTitle;
                  // }
                },
                readonly: true,
                // hintText: controller.selectedpersonalTitle == null
                //     ? 'title'.tr
                //     : controller.selectedpersonalTitle!.name.toString(),
                hintText: "SelectCategory".tr,
              ),
              RegisterCustomTextField(
                // validator: (value) {
                //   if (controller.selectedpersonalTitle == null) {
                //     return 'selectpersonaltitle'.tr;
                //   } else {
                //     return null;
                //   }
                // },
                onTap: () async {
                  // controller.selectedpersonalTitle = null;
                  // PTitle generic = await searchabledropdown(
                  //     context, controller.personalTitleList);
                  // controller.selectedpersonalTitle = null;
                  // controller.updateselectedpersonalTitle(generic);

                  // if (generic.id != null) {
                  //   controller.selectedpersonalTitle = generic;
                  //   controller.selectedpersonalTitle =
                  //       (generic.id == null)
                  //           ? null
                  //           : controller.selectedpersonalTitle;
                  // }
                },
                readonly: true,
                // hintText: controller.selectedpersonalTitle == null
                //     ? 'title'.tr
                //     : controller.selectedpersonalTitle!.name.toString(),
                hintText: "SelectPriority".tr,
              ),
              CustomTextField(
                // validator: (p0) {
                //   if (p0!.isEmpty) {
                //     return 'enteryourfirstname'.tr;
                //   }
                //   return null;
                // },
                controller: ticketController.subjectController,
                hintText: 'Subject'.tr,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextField(
                maxlines: 6,
                controller: ticketController.descriptionController,
                hintText: 'Description'.tr,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              MyButton(
                buttonheight: Get.height * 0.07,
                text: "AttachFile".tr,
                backgroundColor: ColorManager.kWhiteColor,
                buttonwidth: Get.width * 1,
                onPress: () {},
                textColor: ColorManager.kPrimaryBlueColor,
                radius: Get.width * 0.03,
                textfontsize: 18,
                borderColor: ColorManager.kPrimaryBlueColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                      buttonheight: Get.height * 0.06,
                      text: "Update".tr,
                      backgroundColor: ColorManager.kPrimaryColor,
                      buttonwidth: Get.width * 0.4,
                      onPress: () {},
                      textColor: ColorManager.kWhiteColor,
                      radius: Get.width * 0.5,
                      textfontsize: 18),
                  MyButton(
                    buttonheight: Get.height * 0.06,
                    text: "Cancel".tr,
                    backgroundColor: ColorManager.kWhiteColor,
                    buttonwidth: Get.width * 0.4,
                    onPress: () {},
                    textColor: ColorManager.kPrimaryBlueColor,
                    radius: Get.width * 0.5,
                    textfontsize: 18,
                    borderColor: ColorManager.kPrimaryBlueColor,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
