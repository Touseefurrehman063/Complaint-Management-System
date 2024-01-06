import 'package:cms_application/screens/Auth%20Screen/login.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordSucess extends StatefulWidget {
  const NewPasswordSucess({super.key});

  @override
  State<NewPasswordSucess> createState() => _NewPasswordSucessState();
}

class _NewPasswordSucessState extends State<NewPasswordSucess> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () => Get.offAll(() => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.12,
                ),
                Center(
                  child: Image.asset(
                    Images.logo,
                    height: Get.height * 0.07,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.12,
                ),
                SizedBox(
                  height: Get.height * 0.15,
                  width: Get.width * 0.9,
                  child: Image.asset(
                    Images.thumb,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Center(
                  child: Text(
                    'Thank you!'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: Text(
                    'You will be redirected to the login page in 5 seconds...'
                        .tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Click ',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.kblackColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'here',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: ColorManager.kPrimaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Get.offAll(() => const LoginScreen())),
                      TextSpan(
                        text: ' if you are not redirected automatically',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kblackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: 'Need help? Visit our ',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.kblackColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'help center',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
