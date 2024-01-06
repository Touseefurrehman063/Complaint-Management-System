import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/screens/Auth%20Screen/login.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 1,
        width: Get.width * 1,
        decoration: BoxDecoration(
          color: ColorManager.kPrimaryColor,
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
              height: Get.height * 0.16,
            ),
            Image.asset(
              Images.welcomeboy,
              height: Get.height * 0.4,
              width: Get.width * 1,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.05),
              child: Text("Complaint \nManagement System",
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: ColorManager.kWhiteColor,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: Get.width * 0.05),
              child: Text(
                  "Such a system helps in addressing customer issues,\n improving customer satisfaction, and maintaining \n a positive reputation.",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorManager.kWhiteColor,
                      fontWeight: FontWeight.normal)),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Center(
              child: MyButton(
                  buttonheight: Get.height * 0.07,
                  textfontsize: 18,
                  radius: Get.height * 0.06,
                  text: "Let's Go",
                  backgroundColor: ColorManager.kWhiteColor,
                  buttonwidth: Get.width * 0.8,
                  onPress: () {
                    Get.offAll(() => const LoginScreen());
                  },
                  textColor: ColorManager.kPrimaryBlueColor),
            ),
          ],
        ),
      ),
    );
  }
}
