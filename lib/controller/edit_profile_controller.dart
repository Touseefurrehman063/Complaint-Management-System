import 'dart:io';

import 'package:cms_application/components/toaster.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileController extends GetxController implements GetxService {
  static EditProfileController get i => Get.put(EditProfileController());

  late TextEditingController nameController;
  late TextEditingController mobilenumberController;
  late TextEditingController emailController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    mobilenumberController = TextEditingController();
    emailController = TextEditingController();
  }

  File? file;
  Future<File?> pickImage({
    bool allowMultiple = false,
    BuildContext? context,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: allowMultiple);
      if (result != null) {
        file = File(result.files.first.path!);
      }
    } catch (e) {
      bool permissioncheck = await Permission.storage.isGranted;
      if (!permissioncheck) {
        CustomToast.showToaster('PleasegivestoragePermissiontoapplication',
            ColorManager.kRedColor, ColorManager.kWhiteColor);
      } else {
        CustomToast.showToaster('Somethingwentwrong', ColorManager.kRedColor,
            ColorManager.kWhiteColor);
      }
    }
    update();
    return file;
  }
}
