import 'package:cms_application/components/auth_textfield.dart';
import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/screens/Auth%20Screen/otp_screen.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Form(
            key: _formKey,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    'forgottenpassword'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: ColorManager.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Text(
                    'ithappenkindlyenterthemobilenumberassociatedwithyouraccount'
                        .tr,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  AuthTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'pleaseenteryouremail'.tr;
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: 'email'.tr,
                  ),
                  SizedBox(
                    height: Get.height * 0.15,
                  ),
                  MyButton(
                      buttonheight: Get.height * 0.07,
                      text: "Submit",
                      backgroundColor: ColorManager.kPrimaryColor,
                      buttonwidth: Get.width * 1,
                      onPress: () {
                        // if (_formKey.currentState!.validate()) {
                        //   AuthRepo ar = AuthRepo();
                        //   ar.otpCode(emailController.text);
                        // }
                        Get.to(() => const OtpScreen());
                      },
                      textColor: ColorManager.kWhiteColor,
                      radius: Get.width * 0.1,
                      textfontsize: 18),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  MyButton(
                      buttonheight: Get.height * 0.07,
                      text: "Cancel",
                      backgroundColor: ColorManager.kWhiteColor,
                      borderColor: ColorManager.kPrimaryBlueColor,
                      buttonwidth: Get.width * 1,
                      onPress: () {
                        Get.back();
                      },
                      textColor: ColorManager.kPrimaryBlueColor,
                      radius: Get.width * 0.1,
                      textfontsize: 18),
                  const Spacer(),
                  Center(
                    child: RichText(
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
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
