import 'dart:async';
import 'dart:io';

import 'package:cms_application/screens/Auth%20Screen/forget_password.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  bool isChangePasswordLoading = false;
  updateIsChangePasswordloading(bool value) {
    isChangePasswordLoading = value;
    update();
  }

  bool _isotpLoading = false;
  bool get isotpLoading => _isotpLoading;
  bool obsecure = true;
  bool changepassword = true;
  bool changeconfirmpassword = true;
  bool oldpassword = true;
  bool newpassword = true;
  bool newconfirmpassword = true;

  updateobsecurepassword(bool ob) {
    obsecure = !obsecure;
    update();
  }

  updatechangepassword(bool ob) {
    changepassword = !changepassword;
    update();
  }

  updatechangeconfirmpassword(bool ob) {
    changeconfirmpassword = !changeconfirmpassword;
    update();
  }

  updateoldpassword(bool ob) {
    oldpassword = !oldpassword;
    update();
  }

  updatenewpassword(bool ob) {
    newpassword = !newpassword;
    update();
  }

  updatenewconfirmpassword(bool ob) {
    newconfirmpassword = !newconfirmpassword;
    update();
  }

  updateIsotploading(bool value) {
    _isotpLoading = value;
    update();
  }

  String code = '';
  updatecode(c) {
    code = c;
    update();
  }

  String verificationcode = '';
  updateverificationcode(c) {
    verificationcode = c;
    update();
  }

  String otpemail = '';
  updatotpemail(c) {
    otpemail = c;
    update();
  }

  String otpusername = '';
  updateusername(c) {
    otpusername = c;
    update();
  }

  // Forget Password Timer
  RxInt timer = 300.obs;
  var isTimerOver = false.obs;
  void startTimer(ctx) {
    isTimerOver.value = false;
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (tim) {
      if (timer == 0) {
        isTimerOver.value = true;
        tim.cancel();
        // Get.to(() => const ForgetPassword());
        Fluttertoast.showToast(
            msg: "codeexpire".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.kPrimaryColor,
            textColor: ColorManager.kWhiteColor,
            fontSize: 14.0);
      } else {
        timer--;
      }
    });
  }

  File? file;
  late TextEditingController fullname;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController identity;
  late TextEditingController password;
  late TextEditingController retypePassword;
  late TextEditingController street;

  final bool _loginStatus = false;
  bool? get loginStatus => _loginStatus;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  updateIsloading(bool value) {
    _isLoading = value;
    update();
  }

// =======> LoginControllers
  late TextEditingController emailController;
  late TextEditingController passwordController;

  resettimerupdate() {
    timer = 0.obs;
    update();
  }

  disposefields() {
    emailController.clear();
    passwordController.clear();
  }

// ===========>

  @override
  void onInit() {
    fullname = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    identity = TextEditingController();
    password = TextEditingController();
    retypePassword = TextEditingController();
    street = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // selectedGender  = genders![0];
    // log(genders![0].name.toString());

    super.onInit();
  }

  static AuthController get i => Get.put(AuthController());
}
