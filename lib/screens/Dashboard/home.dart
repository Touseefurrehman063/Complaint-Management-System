import 'package:cms_application/components/ticket_search_field.dart';
import 'package:cms_application/controller/home_controller.dart';
import 'package:cms_application/screens/Ticket/ticket_screen.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeController = Get.put<HomeController>(HomeController());

  // //String name = '';
  // // String pmdcno = "";
  // _getUserName() async {
  //   profileContr.value = ((await LocalDb().getOnlineStatus())!);
  //   if (profileContr.value == 0) {
  //     profileContr.status = "iamoffline".tr;
  //   } else if (profileContr.value == 1) {
  //     profileContr.status = "iamonline".tr;
  //   }

  //   // setState(() {});
  // }

  // _getDoctorBasicInfo() async {
  //   ProfileRepo pr = ProfileRepo();
  //   await pr.getDoctorBasicInfo();
  // }

  // String imagepath = '';
  // String path = '';

  // _getimagepath() async {
  //   path = ProfileController.i.selectedbasicInfo?.picturePath ?? "";
  //   String baseurl = baseURL;
  //   imagepath = baseurl + path;
  // }

  // @override
  // void initState() {
  //   _getDoctorBasicInfo();
  //   _getUserName();
  //   _getimagepath();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.kWhiteColor,
              image: DecorationImage(
                image: AssetImage(
                  Images.backgroundimageCrop,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (ZoomDrawer.of(context)!.isOpen()) {
                          ZoomDrawer.of(context)!.close();
                        } else {
                          ZoomDrawer.of(context)!.open();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center, // use aligment
                        color: ColorManager.kWhiteColor,
                        child: Image.asset(
                          Images.menuIcon,
                          height: 27,
                          width: 27,
                          fit: BoxFit.contain,
                          color: ColorManager.kPrimaryBlueColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      Images.logo,
                      height: Get.height * 0.07,
                      width: Get.width * 0.4,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: Get.height * 0.06,
                      width: Get.width * 0.08,
                      child: InkWell(
                          onTap: () {
                            // Get.to(() => const NotificationScreen());
                          },
                          child: Image.asset(
                            Images.notification,
                            color: ColorManager.kPrimaryBlueColor,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.003,
                ),
                Center(
                  child: Text(
                    'Hello Mr. Ahmad !'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: ColorManager.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'Track Your Camplaint'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                CustomTicketSearchField(
                    enable: true,
                    controller: homeController.ticketSearchController),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const TicketScreen());
                  },
                  child: Card(
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Get.width * 0.07)),
                    child: Container(
                      height: Get.height * 0.15,
                      padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.01,
                          vertical: Get.width * 0.03),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            opacity: 0.7,
                            fit: BoxFit.fill,
                            image: AssetImage(
                              Images.homeoverallbackgroundimage,
                            ),
                          ),
                          borderRadius:
                              BorderRadius.circular(Get.width * 0.07)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: Get.height * 0.11,
                              width: Get.width * 0.2,
                              child: Image.asset(
                                Images.homeoverall,
                                color: ColorManager.kWhiteColor,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '20',
                                  style: GoogleFonts.poppins(
                                      fontSize: 40,
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Overall Tickets',
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.003,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Get.width * 0.07)),
                      child: Container(
                        width: Get.width * 0.425,
                        height: Get.height * 0.19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width * 0.07),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorManager.kPrimarypendingColor
                                    .withOpacity(0.4),
                                ColorManager.kPrimarypendingColor,
                              ]),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            // Get.to(const AppointmentHistoryscreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.015,
                                vertical: Get.width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.08,
                                      width: Get.width * 0.14,
                                      child: Image.asset(
                                        Images.homepending,
                                        color: ColorManager.kWhiteColor,
                                      ),
                                    ),
                                    Text(
                                      '10',
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Pending Tickets\n( Not process yet )',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Get.width * 0.07)),
                      child: Container(
                        width: Get.width * 0.425,
                        height: Get.height * 0.19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width * 0.07),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorManager.kPrimaryinprogressColor
                                    .withOpacity(0.4),
                                ColorManager.kPrimaryinprogressColor,
                              ]),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            // Get.to(const AppointmentHistoryscreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.015,
                                vertical: Get.width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.08,
                                      width: Get.width * 0.14,
                                      child: Image.asset(
                                        Images.homeinprogress,
                                        color: ColorManager.kWhiteColor,
                                      ),
                                    ),
                                    Text(
                                      '05',
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  'In Progress\nTickets',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.003,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Get.width * 0.07)),
                      child: Container(
                        width: Get.width * 0.425,
                        height: Get.height * 0.19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width * 0.07),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorManager.kPrimarycancelColor
                                    .withOpacity(0.4),
                                ColorManager.kPrimarycancelColor,
                              ]),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            // Get.to(const AppointmentHistoryscreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.015,
                                vertical: Get.width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.08,
                                      width: Get.width * 0.14,
                                      child: Image.asset(
                                        Images.homecancel,
                                        color: ColorManager.kWhiteColor,
                                      ),
                                    ),
                                    Text(
                                      '02',
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Cancel Tickets',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Get.width * 0.07)),
                      child: Container(
                        width: Get.width * 0.425,
                        height: Get.height * 0.19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Get.width * 0.07),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomCenter,
                              colors: [
                                ColorManager.kPrimarycompleteColor
                                    .withOpacity(0.4),
                                ColorManager.kPrimarycompleteColor,
                              ]),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          onPressed: () {
                            // Get.to(const AppointmentHistoryscreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.015,
                                vertical: Get.width * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.08,
                                      width: Get.width * 0.14,
                                      child: Image.asset(
                                        Images.homecomplete,
                                        color: ColorManager.kWhiteColor,
                                      ),
                                    ),
                                    Text(
                                      '05',
                                      style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          color: ColorManager.kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Completed',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: ColorManager.kWhiteColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.003,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
