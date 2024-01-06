import 'package:cms_application/components/auth_textfield.dart';
import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/controller/forgot_password_controller.dart';
import 'package:cms_application/screens/Auth%20Screen/new_password_sucess_Screen.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  var forgotpasswordcontroller =
      Get.put<ForgotPasswordController>(ForgotPasswordController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                    Center(
                      child: Text(
                        'createnewpassword'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: ColorManager.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Center(
                      child: Text(
                        'kindlyenterauniquepassword'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ColorManager.kblackColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    AuthTextField(
                      obscureText: forgotpasswordcontroller.newpassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          forgotpasswordcontroller.updatenewpassword(
                              !forgotpasswordcontroller.newpassword);
                        },
                        child: forgotpasswordcontroller.newpassword
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'enteryourpassword'.tr;
                        }
                        return null;
                      },
                      controller: forgotpasswordcontroller.passwordController,
                      hintText: 'newpassword'.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    AuthTextField(
                      obscureText: forgotpasswordcontroller.newconfirmpassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          forgotpasswordcontroller.updatenewconfirmpassword(
                              !forgotpasswordcontroller.newconfirmpassword);
                        },
                        child: forgotpasswordcontroller.newconfirmpassword
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'enteryourconfirmationpassword'.tr;
                        }
                        return null;
                      },
                      controller: forgotpasswordcontroller.comfirmController,
                      hintText: 'confirmationnewpassword'.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.15,
                    ),
                    Center(
                      child: MyButton(
                          buttonheight: Get.height * 0.07,
                          text: "Submit",
                          backgroundColor: ColorManager.kPrimaryColor,
                          buttonwidth: Get.width * 1,
                          onPress: () {
                            // if (_formKey.currentState!.validate()) {
                            //   // CALL API HERE
                            //   AuthRepo ar = AuthRepo();
                            //   ar.newPassword(
                            //       passwordController.text,
                            //       confirmPasswordController.text,
                            //       AuthController.i.otpusername,
                            //       AuthController.i.otpemail,
                            //       AuthController.i.verificationcode);
                            // }

                            Get.to(() => const NewPasswordSucess());
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
        ),
      ),
    );
  }
}
