import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var profileContr = Get.put<ProfileController>(ProfileController());

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
      appBar: AppBar(
        leadingWidth: Get.width * 0.2,
        leading: InkWell(
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
              color: ColorManager.kPrimaryColor,
            ),
          ),
        ),
        toolbarHeight: Get.height * 0.1,
        centerTitle: true,
        title: Image.asset(
          Images.logo,
          height: Get.height * 0.07,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    // Get.to(() => const NotificationScreen());
                  },
                  child: Image.asset(
                    Images.notification,
                    height: Get.height * 0.035,
                    color: ColorManager.kPrimaryColor,
                  )),
            ],
          ),
        ],
      ),
      body: GetBuilder<ProfileController>(builder: (cont) {
        return SafeArea(
          minimum:
              EdgeInsets.only(left: Get.width * 0.05, right: Get.width * 0.05)
                  .copyWith(top: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),

                SizedBox(
                  height: Get.height * 0.01,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [

                //     Container(
                //       width: Get.width * 0.45,
                //       height: Get.height * 0.25,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: ColorManager.kPrimaryColor),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             elevation: 0.0,
                //             backgroundColor: Colors.transparent,
                //             shadowColor: Colors.transparent),
                //         onPressed: () {
                //           Get.to(() => const ConfigureAppointmentScreen());
                //         },
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               Images.configuationAppointment,
                //               height: Get.height * 0.1,
                //               width: Get.width * 0.3,
                //             ),
                //             SizedBox(
                //               height: Get.height * 0.01,
                //             ),
                //             Text('configureappointments'.tr,
                //                 textAlign: TextAlign.center,
                //                 style: GoogleFonts.poppins(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 12,
                //                     color: ColorManager.kWhiteColor)),
                //             SizedBox(
                //               height: Get.height * 0.005,
                //             ),
                //             Text('adjustyourschedule'.tr,
                //                 textAlign: TextAlign.center,
                //                 style: GoogleFonts.poppins(
                //                     fontSize: 10,
                //                     color: ColorManager.kWhiteColor))
                //           ],
                //         ),
                //       ),
                //     ),

                //     Container(
                //       width: Get.width * 0.43,
                //       height: Get.height * 0.25,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           gradient: const LinearGradient(
                //               begin: Alignment.topRight,
                //               end: Alignment.bottomRight,
                //               colors: [
                //                 Color(0xffFDD504),
                //                 Color(0xffFCB006),
                //               ])),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             elevation: 0.0,
                //             backgroundColor: Colors.transparent,
                //             shadowColor: Colors.transparent),
                //         onPressed: () {
                //           Get.to(() => const TodayAppointments());
                //           //Get.to(() => DailyViewAppointments());
                //         },
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //               top: Get.height * 0.015,
                //               bottom: Get.height * 0.015),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Image.asset(
                //                 Images.managementAppointment,
                //                 height: Get.height * 0.1,
                //                 width: Get.width * 0.3,
                //               ),
                //               SizedBox(
                //                 height: Get.height * 0.005,
                //               ),
                //               Text('manageappointments'.tr,
                //                   textAlign: TextAlign.center,
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 12,
                //                       color: ColorManager.kWhiteColor)),
                //               SizedBox(
                //                 height: Get.height * 0.005,
                //               ),
                //               Text('approve/aisapproveappointments'.tr,
                //                   textAlign: TextAlign.center,
                //                   style: GoogleFonts.poppins(
                //                       fontSize: 10,
                //                       color: ColorManager.kWhiteColor))
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: Get.height * 0.01,
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [

                //     Container(
                //       width: Get.width * 0.45,
                //       height: Get.height * 0.25,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: ColorManager.kPrimaryColor),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             elevation: 0.0,
                //             backgroundColor: Colors.transparent,
                //             shadowColor: Colors.transparent),
                //         onPressed: () {
                //           Get.to(const AppointmentHistoryscreen());
                //         },
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               Images.consultedVault,
                //               height: Get.height * 0.1,
                //               width: Get.width * 0.3,
                //             ),
                //             SizedBox(
                //               height: Get.height * 0.01,
                //             ),
                //             Text('consultedvault'.tr,
                //                 textAlign: TextAlign.center,
                //                 style: GoogleFonts.poppins(
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 12,
                //                     color: ColorManager.kWhiteColor)),
                //             SizedBox(
                //               height: Get.height * 0.005,
                //             ),
                //             Text('viewconsultations'.tr,
                //                 textAlign: TextAlign.center,
                //                 style: GoogleFonts.poppins(
                //                     fontSize: 10,
                //                     color: ColorManager.kWhiteColor))
                //           ],
                //         ),
                //       ),
                //     ),

                //     Container(
                //       width: Get.width * 0.43,
                //       height: Get.height * 0.25,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           gradient: const LinearGradient(colors: [
                //             Color(0xffFF4D4D),
                //             Color(0xffFF7B7B),
                //           ])),
                //       child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             elevation: 0.0,
                //             backgroundColor: Colors.transparent,
                //             shadowColor: Colors.transparent),
                //         onPressed: () {
                //           Fluttertoast.showToast(
                //               msg: "ComingSoon".tr,
                //               toastLength: Toast.LENGTH_SHORT,
                //               gravity: ToastGravity.CENTER,
                //               timeInSecForIosWeb: 1,
                //               backgroundColor: ColorManager.kPrimaryLightColor,
                //               textColor: ColorManager.kPrimaryColor,
                //               fontSize: 14.0);
                //           //  Get.to(const HealthSummaryScreen());
                //         },
                //         child: Padding(
                //           padding: EdgeInsets.only(
                //               top: Get.height * 0.015,
                //               bottom: Get.height * 0.015),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Image.asset(
                //                 Images.healthSummry,
                //                 height: Get.height * 0.1,
                //                 width: Get.width * 0.3,
                //               ),
                //               SizedBox(
                //                 height: Get.height * 0.01,
                //               ),
                //               Text('healthsummary'.tr,
                //                   textAlign: TextAlign.center,
                //                   style: GoogleFonts.poppins(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 12,
                //                       color: ColorManager.kWhiteColor)),
                //               SizedBox(
                //                 height: Get.height * 0.005,
                //               ),
                //               Text('patientmonitoring'.tr,
                //                   textAlign: TextAlign.center,
                //                   style: GoogleFonts.poppins(
                //                       fontSize: 10,
                //                       color: ColorManager.kWhiteColor))
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: Get.height * 0.01,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
