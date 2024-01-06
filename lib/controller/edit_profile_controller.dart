import 'dart:io';

import 'package:cms_application/components/toaster.dart';
import 'package:cms_application/models/address_model.dart';
import 'package:cms_application/repositories/edit_Profile_repo.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileController extends GetxController implements GetxService {
  static EditProfileController get i => Get.put(EditProfileController());

  late TextEditingController nameController;
  late TextEditingController mobilenumberController;
  late TextEditingController emailController;

  Address selectedCountry = Address();
  Address selectedProvince = Address();
  Address selectedCity = Address();

  List<Address> countryList = [];
  List<Address> provinceList = [];
  List<Address> cityList = [];

// COUNTRY
  void fetchCountries() async {
    EditProfileRepo epr = EditProfileRepo();
    countryList = await epr.getCountries();
    update();
  }

  void updateSelectedCountry(Address country) {
    selectedCountry = country;
    update();
  }

// PROVINCE
  void fetchProvince(countryid) async {
    EditProfileRepo epr = EditProfileRepo();
    provinceList = await epr.getProvince(countryid);
    update();
  }

  void updateSelectedProvince(Address province) {
    selectedProvince = province;
    update();
  }

  // Cities
  void fetchCities(provinceId) async {
    EditProfileRepo epr = EditProfileRepo();
    cityList = await epr.getCity(provinceId);
    update();
  }

  void updateSelectedCity(Address city) {
    selectedCity = city;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchCountries();
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
        CustomToast.showToaster('PleasegivestoragePermissiontoapplication'.tr,
            ColorManager.kRedColor, ColorManager.kWhiteColor);
      } else {
        CustomToast.showToaster('Somethingwentwrong'.tr, ColorManager.kRedColor,
            ColorManager.kWhiteColor);
      }
    }
    update();
    return file;
  }
}
