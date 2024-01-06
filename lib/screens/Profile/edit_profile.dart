import 'package:cms_application/components/edit_profile_textfield.dart';
import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/components/searchable_dropdown.dart';
import 'package:cms_application/controller/edit_profile_controller.dart';
import 'package:cms_application/models/address_model.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var editProfileController =
      Get.put<EditProfileController>(EditProfileController());
  @override
  @override
  Widget build(BuildContext context) {
    var editProfileController =
        Get.put<EditProfileController>(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.kPrimaryBlueColor,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'EditProfile'.tr,
          style: GoogleFonts.poppins(
            textStyle: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ColorManager.kPrimaryBlueColor),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: GetBuilder<EditProfileController>(
          builder: (cont) => Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<EditProfileController>(builder: (cont) {
                    return InkWell(
                      onTap: () {
                        editProfileController.pickImage();
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(Images.avatar))),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.green,
                              child: IconButton(
                                  onPressed: () async {
                                    editProfileController.file = null;
                                    await editProfileController.pickImage();
                                    // if (edit.file != null) {
                                    //   ProfileRepo pr = ProfileRepo();
                                    //   pr.updatePicture(edit.file!,
                                    //       cont.selectedbasicInfo!.picturePath);
                                    // }
                                  },
                                  icon: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 15,
                                  )),
                            )),
                      ),
                    );
                  }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  EditProfileCustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'pleaseenteryourname'.tr;
                      }
                      return null;
                    },
                    hintText: 'Name'.tr,
                    controller: editProfileController.nameController,
                  ),
                  EditProfileCustomTextField(
                      onTap: () {
                        // EditProfileController.i.selectDateAndTime(context,
                        //     EditProfileController.arrival, edit.formatearrival);
                      },
                      readonly: true,
                      // hintText: EditProfileController.i.formatearrival.toString(),
                      hintText: "DateofBirth".tr),
                  EditProfileCustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'pleaseenteryourcontactno'.tr;
                      }
                      return null;
                    },
                    hintText: 'ContactNo'.tr,
                    controller: editProfileController.mobilenumberController,
                  ),
                  EditProfileCustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'pleaseenteryouremail'.tr;
                      }
                      return null;
                    },
                    hintText: 'Email'.tr,
                    controller: editProfileController.emailController,
                  ),
                  EditProfileCustomTextField(
                    onTap: () async {
                      editProfileController.selectedProvince = Address();
                      editProfileController.selectedCity = Address();
                      editProfileController.provinceList.clear();
                      editProfileController.cityList.clear();
                      Address generic = await searchabledropdown(
                          context, editProfileController.countryList);
                      editProfileController.updateSelectedCountry(generic);
                      if (generic.id == null) {
                        editProfileController.selectedCountry = generic;
                        editProfileController.selectedCountry =
                            ((generic.id == null)
                                ? null
                                : editProfileController.selectedCountry)!;
                      }
                      String provinceid =
                          editProfileController.selectedCountry.id.toString();
                      editProfileController.fetchProvince(provinceid);
                    },
                    validator: (value) {
                      if (editProfileController.selectedCountry.id == null) {
                        return 'pleaseselectyourcountry'.tr;
                      }
                      return null;
                    },
                    readonly: true,
                    hintText: editProfileController.selectedCountry.id == null
                        ? "Country".tr
                        : editProfileController.selectedCountry.name ?? "",
                  ),
                  EditProfileCustomTextField(
                    onTap: () async {
                      if (editProfileController.selectedCountry.id != null) {
                        editProfileController.selectedCity = Address();
                        editProfileController.cityList.clear();
                        Address generic = await searchabledropdown(
                            context, editProfileController.provinceList);
                        editProfileController.updateSelectedProvince(generic);
                        if (generic.id == null) {
                          editProfileController.selectedProvince = generic;
                          editProfileController.selectedProvince =
                              ((generic.id == null)
                                  ? null
                                  : editProfileController.selectedProvince)!;
                        }
                        String cityid = editProfileController
                            .selectedProvince.id
                            .toString();
                        editProfileController.fetchCities(cityid);
                      }
                    },
                    validator: (value) {
                      if (editProfileController.selectedProvince.id == null) {
                        return 'pleaseselectyourprovince'.tr;
                      }
                      return null;
                    },
                    readonly: true,
                    hintText: editProfileController.selectedProvince.id == null
                        ? "ProvinceState".tr
                        : editProfileController.selectedProvince.name ?? "",
                  ),
                  EditProfileCustomTextField(
                    onTap: () async {
                      if (editProfileController.selectedProvince.id != null) {
                        Address generic = await searchabledropdown(
                            context, editProfileController.cityList);
                        editProfileController.updateSelectedCity(generic);
                        if (generic.id == null) {
                          editProfileController.selectedCity = generic;
                          editProfileController.selectedCity =
                              ((generic.id == null)
                                  ? null
                                  : editProfileController.selectedCity)!;
                        }
                      }
                    },
                    validator: (value) {
                      if (editProfileController.selectedCity.id == null) {
                        return 'pleaseselectyourcity'.tr;
                      }
                      return null;
                    },
                    readonly: true,
                    hintText: editProfileController.selectedCity.id == null
                        ? "City".tr
                        : editProfileController.selectedCity.name ?? "",
                  ),
                  SizedBox(height: Get.height * 0.01),
                  MyButton(
                      buttonheight: Get.height * 0.08,
                      text: "Update".tr,
                      backgroundColor: ColorManager.kPrimaryColor,
                      buttonwidth: Get.width * 1,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          print('ok');
                        }
                      },
                      textColor: ColorManager.kWhiteColor,
                      radius: Get.width * 0.5,
                      textfontsize: 18),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
