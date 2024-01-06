import 'package:cms_application/components/dottet_line.dart';
import 'package:cms_application/components/profile_record.dart';
import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/screens/Dashboard/menu_drawer.dart';
import 'package:cms_application/screens/Profile/edit_profile.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorManager.kPrimaryColor,
        width: Get.width * 1,
        height: Get.height * 1,
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
                  'Profile'.tr,
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: ColorManager.kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.08),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.04),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: Get.width * 1,
                        decoration: BoxDecoration(
                          color: ColorManager.kWhiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Get.width * 0.1),
                            topRight: Radius.circular(Get.width * 0.1),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.07,
                            ),
                            Text(
                              'Mr. Obaid',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'ahmad@gmail.com',
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Get.height * 0.01),
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: Get.width * 0.9,
                                    decoration: BoxDecoration(
                                        color: ColorManager.kPrimaryColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(Get.width * 0.07),
                                        ),
                                        border: Border.all(
                                            color:
                                                ColorManager.kPrimaryBlueColor,
                                            width: 1.5)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.05),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.06,
                                            width: Get.width * 0.1,
                                            child: InkWell(
                                                onTap: () {
                                                  Get.to(() =>
                                                      const EditProfile());
                                                },
                                                child: Image.asset(
                                                  Images.editIcon,
                                                  color:
                                                      ColorManager.kWhiteColor,
                                                )),
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.02,
                                          ),
                                          const MySeparator(
                                            color: ColorManager.kWhiteColor,
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.03,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "Name",
                                            name: "Obaid",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "Date of Birth",
                                            name: "19-03-2000",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "Contact No",
                                            name: "+92 331 123 4567",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "Email",
                                            name: "ahmad@gmail.com",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "Country",
                                            name: "Pakistan",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "Province/State",
                                            name: "Punjab",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.01,
                                          ),
                                          const ProfileRecordWidget(
                                            title: "City",
                                            name: "Rawalpindi",
                                          ),
                                          SizedBox(
                                            height: Get.height * 0.03,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -Get.height * 0.1,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: Get.width * 0.2,
                        backgroundColor: ColorManager.kPrimaryColor,
                        child: CircleAvatar(
                          radius: Get.width * 0.18,
                          backgroundColor: ColorManager.kWhiteColor,
                          backgroundImage: AssetImage(Images.avatar),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
