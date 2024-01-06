import 'dart:async';

import 'package:cms_application/components/toaster.dart';
import 'package:cms_application/screens/Auth%20Screen/forget_password.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  static ForgotPasswordController get i => Get.put(ForgotPasswordController());

  late TextEditingController passwordController;
  late TextEditingController comfirmController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passwordController = TextEditingController();
    comfirmController = TextEditingController();
  }

  bool newpassword = true;
  bool newconfirmpassword = true;

  updatenewpassword(bool ob) {
    newpassword = !newpassword;
    update();
  }

  updatenewconfirmpassword(bool ob) {
    newconfirmpassword = !newconfirmpassword;
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
        Get.to(() => const ForgetPassword());
        CustomToast.showToaster(
            'codeexpire', ColorManager.kPrimaryColor, ColorManager.kWhiteColor);
      } else {
        timer--;
      }
    });
  }

  resettimerupdate() {
    timer.close();
    update();
  }
}
