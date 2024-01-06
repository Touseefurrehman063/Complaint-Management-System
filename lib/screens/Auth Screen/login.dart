// ignore_for_file: avoid_unnecessary_containers
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:cms_application/components/auth_textfield.dart';
import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/controller/auth_controller.dart';
import 'package:cms_application/screens/Auth%20Screen/forget_password.dart';
import 'package:cms_application/screens/Dashboard/menu_drawer.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:cms_application/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // call();
    // getfingerprint();
    super.initState();
  }

  // getfingerprint() async {
  //   isfingerprintEnable = await LocalDb.getfingerprint();
  //   setState(() {
  //     isfingerprintEnable;
  //   });
  // }

  // bool isfingerprintEnable = false;
  // final LocalAuthentication auth = LocalAuthentication();

  // call() async {
  //   // String? username = await LocalDb().getUsername();
  //   // String? userpassword = await LocalDb().getPassword();

  //     String? username = 'obaid';
  //   String? userpassword = '123';

  //   bool fingerprint = await LocalDb.getfingerprint();
  //   if (username != null && userpassword != null && fingerprint) {
  //     bool auth = await Authentication.authentication();

  //     if (auth) {
  //       if (auth) {
  //         fingerprint = auth;
  //       }
  //       if (fingerprint) {
  //         if (auth) {
  //           if (ProfileController.i.selectedbasicInfo?.id != null) {
  //             Fluttertoast.showToast(
  //                 msg: 'You are already Logged in',
  //                 toastLength: Toast.LENGTH_SHORT,
  //                 gravity: ToastGravity.BOTTOM,
  //                 timeInSecForIosWeb: 1,
  //                 backgroundColor: ColorManager.kRedColor,
  //                 textColor: ColorManager.kWhiteColor,
  //                 fontSize: 14.0);
  //             setState(() {
  //               fingerprint = true;
  //             });
  //           } else {
  //             AuthController.i.updateIsloading(true);
  //             // await AuthRepo.login(cnic: username, password: userpassword);
  //             AuthController.i.updateIsloading(false);
  //           }
  //         }
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var login = Get.put<AuthController>(AuthController());
    return GetBuilder<AuthController>(builder: (cnt) {
      return BlurryModalProgressHUD(
          inAsyncCall: AuthController.i.isLoading,
          blurEffectIntensity: 4,
          progressIndicator: const SpinKitSpinningLines(
            color: ColorManager.kPrimaryColor,
            size: 60,
          ),
          dismissible: false,
          opacity: 0.4,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: GetBuilder<AuthController>(builder: (cnt) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Form(
                  key: _formKey,
                  child: SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.kWhiteColor,
                          image: DecorationImage(
                            image: AssetImage(
                              Images.backgroundimageCrop,
                            ),
                          ),
                        ),
                        height: Get.height,
                        width: Get.width,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.05,
                              ),
                              SizedBox(
                                child: Center(
                                  child: Image.asset(
                                    Images.logo,
                                    height: Get.height * 0.07,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.14,
                              ),
                              SizedBox(
                                height: Get.height * 0.64,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome to'.tr,
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          color: ColorManager.kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      appName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: ColorManager.kPrimaryBlueColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.04,
                                    ),
                                    AuthTextField(
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return 'EnterUsername'.tr;
                                        }
                                        return null;
                                      },
                                      controller: login.emailController,
                                      hintText: 'username'.tr,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    AuthTextField(
                                      validator: (p0) {
                                        if (p0!.isEmpty) {
                                          return 'enteryourpassword'.tr;
                                        }
                                        return null;
                                      },
                                      obscureText: login.obsecure,
                                      suffixIcon: InkWell(
                                          onTap: () {
                                            login.updateobsecurepassword(
                                                !login.obsecure);
                                          },
                                          child: login.obsecure
                                              ? const Icon(
                                                  CupertinoIcons.eye_slash,
                                                  color: ColorManager
                                                      .kPrimaryBlueColor,
                                                )
                                              : const Icon(
                                                  CupertinoIcons.eye,
                                                  color: ColorManager
                                                      .kPrimaryBlueColor,
                                                )),
                                      controller: login.passwordController,
                                      hintText: 'password'.tr,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(
                                                () => const ForgetPassword());
                                          },
                                          child: Text(
                                            'Forgot Password?'.tr,
                                            style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: ColorManager
                                                    .kPrimaryBlueColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    // Visibility(
                                    //   visible: isfingerprintEnable,
                                    //   child: SizedBox(
                                    //     height: Get.height * 0.08,
                                    //     child: Center(
                                    //         child: InkWell(
                                    //       onTap: () {
                                    //         call();
                                    //       },
                                    //       child: Image.asset(
                                    //           Images.fingerprint),
                                    //     )),
                                    //   ),
                                    // ),

                                    Center(
                                      child: MyButton(
                                          buttonheight: Get.height * 0.07,
                                          textfontsize: 18,
                                          radius: Get.height * 0.06,
                                          text: 'Log In',
                                          backgroundColor:
                                              ColorManager.kPrimaryColor,
                                          buttonwidth: Get.width * 0.8,
                                          onPress: () {
                                            Get.offAll(
                                                () => const DrawerScreen());
                                            // if (_formKey.currentState!
                                            //     .validate()) {
                                            //   FocusScope.of(context)
                                            //       .unfocus();

                                            //   try {
                                            //     await AuthRepo.login(
                                            //         cnic: login
                                            //             .emailController.text,
                                            //         password: login
                                            //             .passwordController
                                            //             .text);
                                            //   } catch (e) {}
                                            // }
                                          },
                                          textColor: ColorManager.kWhiteColor),
                                    ),

                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),

                                    Center(
                                      child: Text(
                                        'Terms & Conditions apply'.tr,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: ColorManager.kblackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ));
          }));
    });
  }
}

class SignupOrLoginText extends StatelessWidget {
  final Function()? onTap;
  final String? pre;
  final String? suffix;
  const SignupOrLoginText({
    super.key,
    this.pre,
    this.suffix,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$pre',
          //  style: Theme.of(context).textTheme.bodyMedium,
          style: GoogleFonts.poppins(
              fontSize: 15, color: ColorManager.kblackColor),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            '$suffix',
            // style: Theme.of(context)
            //     .textTheme
            //     .bodySmall!
            //     .copyWith(color: ColorManager.kPrimaryColor),
            style: GoogleFonts.poppins(
                fontSize: 15,
                color: ColorManager.kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
