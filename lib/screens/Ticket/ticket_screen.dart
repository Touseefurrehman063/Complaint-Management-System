import 'package:cms_application/components/custom_ticket.dart';
import 'package:cms_application/components/custom_ticket_container_row.dart';
import 'package:cms_application/components/ticket_search_field.dart';
import 'package:cms_application/controller/home_controller.dart';
import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/controller/ticker_controller.dart';
import 'package:cms_application/screens/Dashboard/menu_drawer.dart';
import 'package:cms_application/screens/Ticket/ticket_alert_dialog.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  var homeController = Get.put<HomeController>(HomeController());
  var ticketController = Get.put<TicketController>(TicketController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorManager.kWhiteColor,
        ),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.35,
              width: Get.width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        Images.orangebackgroundimage,
                      ),
                      fit: BoxFit.cover),
                  // color: ColorManager.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Get.width * 0.1),
                      bottomRight: Radius.circular(Get.width * 0.1))),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.06),
                  Row(
                    children: [
                      SizedBox(width: Get.width * 0.04),
                      SizedBox(
                        height: Get.height * 0.08,
                        width: Get.width * 0.1,
                        child: InkWell(
                            onTap: () {
                              ProfileController.i.updateselectedPage(0);
                              Get.offAll(() => const DrawerScreen());
                            },
                            child: Image.asset(
                              Images.backbutton,
                            )),
                      ),
                      SizedBox(width: Get.width * 0.3),
                      Text(
                        'Tickets'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: ColorManager.kWhiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Get.width * 0.05)),
                    elevation: 14,
                    surfaceTintColor: ColorManager.kWhiteColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.03,
                          vertical: Get.height * 0.01),
                      child: SizedBox(
                        width: Get.width * 0.84,
                        height: Get.height * 0.15,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: Get.width * 0.04,
                                  bottom: Get.height * 0.01),
                              child: Text(
                                'My Tickets'.tr,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: ColorManager.kPrimaryColor,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            CustomTicketSearchField(
                                enable: true,
                                controller:
                                    homeController.ticketSearchController),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        'From'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: ColorManager.kblackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.kWhiteColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.white,
                            ),
                            // color: ColorManager.kWhiteColor,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: CupertinoTextField(
                              readOnly: true,
                              controller: TextEditingController(
                                text: ticketController.dateFormatalert
                                    .format(ticketController.dateTimealert),
                              ),
                              prefix: Padding(
                                padding:
                                    EdgeInsets.only(left: Get.width * 0.02),
                                child: const Icon(
                                  Icons.calendar_month,
                                  color: CupertinoColors.black,
                                ),
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: CupertinoColors.black,
                              ),
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) => Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: CupertinoDatePicker(
                                        backgroundColor: Colors.white,
                                        initialDateTime:
                                            ticketController.dateTimealert,
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() => ticketController
                                              .dateTimealert = newTime);
                                        },
                                        use24hFormat: true,
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Get.height * 0.015),
                    child: Text(
                      '-'.tr,
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: ColorManager.kblackColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'To'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: ColorManager.kblackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Card(
                        elevation: 2,
                        child: Container(
                          //  color: ColorManager.kWhiteColor,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorManager.kWhiteColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: CupertinoColors.white,
                          ),
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: CupertinoTextField(
                            readOnly: true,
                            controller: TextEditingController(
                              text: ticketController.dateFormatalert
                                  .format(ticketController.dateTime2alert),
                            ),
                            prefix: Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.02),
                              child: const Icon(
                                Icons
                                    .calendar_month, // You can replace this with your desired icon
                                color: CupertinoColors.black,
                              ),
                            ),
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: CupertinoColors.black,
                            ),
                            onTap: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) => Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime:
                                          ticketController.dateTime2alert,
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() => ticketController
                                            .dateTime2alert = newTime);
                                      },
                                      use24hFormat: true,
                                      mode: CupertinoDatePickerMode.date,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                    width: Get.width * 0.1,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Images.filter,
                        )),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                    width: Get.width * 0.1,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Images.searchbutton,
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
              child: SizedBox(
                height: Get.height * 0.1,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: ticketController.containerList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomTicketContainerRow(
                      color: ticketController.containerList[index].color,
                      name: ticketController.containerList[index].name,
                      count: ticketController.containerList[index].count,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: InkWell(
                        onTap: () {
                          ticketAlert(context);
                        },
                        child: CustomTickets(
                          color: ColorManager.kPrimarycompleteColor,
                          heading:
                              "#Ticket: 231101001 | 23 Dec, 2023 | 09:00AM",
                          subheading: "Export Not Working",
                          priority: "High Priority",
                          status: "Completed",
                          statuskey: "inprogress",
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
