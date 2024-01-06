import 'dart:io';
import 'package:cms_application/components/toaster.dart';
import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/screens/Add%20Ticket/add_ticket.dart';
import 'package:cms_application/screens/Dashboard/home.dart';
import 'package:cms_application/screens/Profile/profile.dart';
import 'package:cms_application/screens/Ticket/ticket_screen.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:cms_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with WidgetsBindingObserver {
  _launchWhatsApp() async {
    String androidUrl =
        "whatsapp://send?phone=$contactnumber&text=Hi, I need some help";
    String iosUrl =
        "https://wa.me/$contactnumber?text=Hi,%20I%20need%20some%20help";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      CustomToast.showToaster('WhatsAppisnotinstalledonyourdevice'.tr,
          ColorManager.kPrimaryColor, ColorManager.kWhiteColor);
    }
  }

  bool isKeyboardVisible = false;
  final List<Widget> pages = [
    const HomeScreen(),
    const TicketScreen(),
    const AddTickets(),
    const ProfileScreen(),
  ];

  // _getDoctorBasicInfo() async {
  //   ProfileRepo pr = ProfileRepo();
  //   await pr.getDoctorBasicInfo();
  // }

  void navigateToPage(int index) async {
    // if (index == 1) {

    // } else if (index == 2) {

    // } else if (index == 3) {
    //   bool? isLoggedin = await LocalDb().getLoginStatus();
    //   if ((isLoggedin ?? false) == false) {
    //     Get.to(() => const LoginScreen());
    //   } else if (index == 0) {
    //     // await _getDoctorBasicInfo();
    //   }
    // }
    // setState(() {
    ProfileController.i.updateselectedPage(index);
    // });
  }

  int tap = 0;
  Future<bool> showExitPopup() async {
    if (ZoomDrawer.of(context)!.isOpen()) {
      ZoomDrawer.of(context)!.close();
    } else if (tap == 0) {
      tap++;
      return false;
    } else if (tap == 1) {
      tap = 0;
      return true;
    }
    return false;
  }

  Future<bool> homeScreenPopup() async {
    ProfileController.i.updateselectedPage(0);
    setState(() {});

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(builder: (context) {
        return IndexedStack(
          index: ProfileController.i.selectedPage,
          children: pages,
        );
      }),
      bottomNavigationBar: bottomAppbar(context),
    );
  }

  bottomAppbar(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (cont) => WillPopScope(
        onWillPop: ProfileController.i.selectedPage == 0 &&
                ZoomDrawer.of(context)!.isOpen() == false
            ? showExitPopup
            : homeScreenPopup,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(int.parse('#1E1E1E'.substring(1, 7), radix: 16) +
                    0xFF000000),
                blurRadius: 6.0,
                spreadRadius: 0.4,
              )
            ],
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: Get.height * 0.11,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildBottomNavItem(Images.homeIcon, "Home".tr, 0, isSvg: false),
              buildBottomNavItem(Images.ticketIcon, "Tickets".tr, 1,
                  isSvg: false),
              buildBottomNavItem(Images.addticketIcon, "AddTicket".tr, 2,
                  isSvg: false),
              buildBottomNavItem(Images.profileIcon, 'Profile'.tr, 3,
                  isSvg: false),
              buildBottomNavItem(Images.helpIcon, 'Help'.tr, 4, isSvg: false),
            ],
          ),
        ),
      ),
    );
  }

  buildBottomNavItem(String imagePath, String label, int index,
      {bool? isSvg = false}) {
    final isSelected = ProfileController.i.selectedPage == index;
    return InkWell(
      onTap: () {
        if (index == 4) {
          _launchWhatsApp();
        } else {
          navigateToPage(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          imagePath.isEmpty
              ? const SizedBox()
              : isSvg == false
                  ? Image.asset(
                      imagePath,
                      height: Get.height * 0.045,
                      color: !isSelected
                          ? ColorManager.kPrimaryBlueColor
                          : ColorManager.kPrimaryColor,
                    )
                  : Container(
                      padding: EdgeInsets.all(Get.width * 0.022),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: ColorManager.kPrimaryBlueColor,
                              blurRadius: 1.0,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.normal,
                              offset: Offset(
                                1,
                                2,
                              ),
                            )
                          ],
                          shape: BoxShape.circle,
                          color: isSelected == true
                              ? ColorManager.kPrimaryColor
                              : ColorManager.kPrimaryBlueColor),
                      child: SvgPicture.asset(
                        height: Get.height * 0.03,
                        imagePath,
                        color: isSelected
                            ? Colors.white
                            : ColorManager.kPrimaryColor,
                      ),
                    ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(label,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: !isSelected
                    ? ColorManager.kPrimaryBlueColor
                    : ColorManager.kPrimaryColor,
              ))
        ],
      ),
    );
  }
}
