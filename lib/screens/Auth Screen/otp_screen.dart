import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/controller/forgot_password_controller.dart';
import 'package:cms_application/screens/Auth%20Screen/create_new_password.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var forgotpasswordcontroller =
      Get.put<ForgotPasswordController>(ForgotPasswordController());
  @override
  void initState() {
    // TODO: implement initState
    ForgotPasswordController.i.timer = 300.obs;
    ForgotPasswordController.i.startTimer(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ForgotPasswordController.i.resettimerupdate();
    super.dispose();
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
                Center(
                  child: Text(
                    'Enter OTP'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: ColorManager.kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Center(
                  child: Text(
                    'Thank you!'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'An OTP has been sent to your email address.'.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorManager.kblackColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'ahmad@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorManager.kblackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  enabledBorderColor: ColorManager.kblackColor,
                  focusedBorderColor: ColorManager.kPrimaryColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    // AuthController.i.updatecode(verificationCode);
                  },
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Obx(
                  () => Center(
                    child: Text(
                      "${'expirein'.tr} ${forgotpasswordcontroller.timer ~/ 60}:${forgotpasswordcontroller.timer % 60}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ColorManager.kblackColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                Center(
                  child: MyButton(
                      buttonheight: Get.height * 0.07,
                      text: "verifycode",
                      backgroundColor: ColorManager.kPrimaryColor,
                      buttonwidth: Get.width * 1,
                      onPress: () {
                        // String usercode = AuthController.i.code;
                        // String verificationcode = AuthController.i.verificationcode;
                        // if (usercode == verificationcode) {
                        //   Get.to(() => const CreateNewPasswordScreen());
                        // } else {
                        //   Fluttertoast.showToast(
                        //       msg: 'wrongcode'.tr,
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.BOTTOM,
                        //       timeInSecForIosWeb: 1,
                        //       backgroundColor: ColorManager.kRedColor,
                        //       textColor: ColorManager.kWhiteColor,
                        //       fontSize: 14.0);
                        // }
                        ForgotPasswordController.i.resettimerupdate();
                        Get.to(() => const CreateNewPasswordScreen());
                      },
                      textColor: ColorManager.kWhiteColor,
                      radius: Get.width * 0.1,
                      textfontsize: 18),
                ),
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
    );
  }
}
