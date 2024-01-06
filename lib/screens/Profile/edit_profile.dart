import 'package:cms_application/components/edit_profile_textfield.dart';
import 'package:cms_application/components/my_button.dart';
import 'package:cms_application/controller/edit_profile_controller.dart';
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile'.tr,
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
                    hintText: 'fullName'.tr,
                    controller: editProfileController.nameController,
                  ),
                  EditProfileCustomTextField(
                      onTap: () {
                        // EditProfileController.i.selectDateAndTime(context,
                        //     EditProfileController.arrival, edit.formatearrival);
                      },
                      readonly: true,
                      // hintText: EditProfileController.i.formatearrival.toString(),
                      hintText: "Date of Birth"),
                  EditProfileCustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'pleaseenteryourname'.tr;
                      }
                      return null;
                    },
                    hintText: 'mobilenumber'.tr,
                    controller: editProfileController.mobilenumberController,
                  ),
                  EditProfileCustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'pleaseenteryouremail'.tr;
                      }
                      return null;
                    },
                    hintText: 'email'.tr,
                    controller: editProfileController.emailController,
                  ),
                  EditProfileCustomTextField(
                    onTap: () async {
                      // edit.selectedcountry = null;
                      // edit.selectedcity = null;
                      // edit.citiesList.clear();
                      // edit.selectedprovince = null;
                      // //  edit.provinceList.clear();
                      // widget.province = 'province'.tr;
                      // widget.city = 'city'.tr;

                      // Countries generic =
                      //     await searchabledropdown(context, edit.countriesList);
                      // edit.selectedcountry = null;
                      // edit.updateselectedCountry(generic);

                      // if (generic.id != null) {
                      //   edit.selectedcountry = generic;
                      //   edit.selectedcountry =
                      //       (generic.id == null) ? null : edit.selectedcountry;
                      // }
                      // String cid =
                      //     EditProfileController.i.selectedcountry!.id.toString();
                      // setState(() {
                      //   _getProvinces(cid);
                      // });
                    },
                    validator: (value) {
                      if (value == "country".tr) {
                        return 'pleaseselectyourcountry'.tr;
                      }
                      return null;
                    },
                    readonly: true,

                    // hintText: EditProfileController.i.selectedcountry == null
                    //     ? "country".tr
                    //     : EditProfileController.i.selectedcountry?.name ?? "",

                    hintText: "country",
                  ),
                  EditProfileCustomTextField(
                    onTap: () async {
                      // edit.selectedprovince = null;
                      // edit.selectedcity = null;
                      // Provinces generic =
                      //     await searchabledropdown(context, edit.provinceList);
                      // edit.selectedprovince = null;
                      // edit.updateselectedprovince(generic);

                      // if (generic.id != null) {
                      //   edit.selectedprovince = generic;
                      //   edit.selectedprovince =
                      //       (generic.id == null) ? null : edit.selectedprovince;
                      // }
                      // String cid = EditProfileController.i.selectedprovince!.id
                      //     .toString();
                      // setState(() {
                      //   _getCities(cid);
                      // });
                    },
                    validator: (value) {
                      if (value == "province".tr) {
                        return 'pleaseselectyourprovince';
                      }
                      return null;
                    },
                    readonly: true,

                    // hintText: EditProfileController.i.selectedprovince == null
                    //     ? "province".tr
                    //     : EditProfileController.i.selectedprovince?.name ?? "",
                    hintText: "State/Province",
                  ),
                  EditProfileCustomTextField(
                    onTap: () async {
                      // edit.selectedcity = null;
                      // Cities generic =
                      //     await searchabledropdown(context, edit.citiesList);
                      // edit.selectedcity = null;
                      // edit.updateselectedcity(generic);

                      // if (generic.id != null) {
                      //   edit.selectedcity = generic;
                      //   edit.selectedcity =
                      //       (generic.id == null) ? null : edit.selectedcity;
                      // }
                    },
                    validator: (value) {
                      if (value == "city") {
                        return 'pleaseselectyourcity'.tr;
                      }
                      return null;
                    },
                    readonly: true,
                    // hintText: EditProfileController.i.selectedcity == null
                    //     ? "city".tr
                    //     : EditProfileController.i.selectedcity?.name ?? "",
                    hintText: "city",
                  ),
                  SizedBox(height: Get.height * 0.01),
                  MyButton(
                      buttonheight: Get.height * 0.08,
                      text: "Update",
                      backgroundColor: ColorManager.kPrimaryColor,
                      buttonwidth: Get.width * 1,
                      onPress: () {},
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
