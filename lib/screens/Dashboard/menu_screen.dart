import 'package:cms_application/components/language_dialog.dart';
import 'package:cms_application/controller/profile_controller.dart';
import 'package:cms_application/screens/Auth%20Screen/login.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:cms_application/utils/color_manager.dart';
import 'package:cms_application/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // String UserName = '';
  // String PMDCNumber = '';
  // _getUserName() async {
  //   String? userName = await LocalDb().getDoctorFullName();
  //   String? PMDCNumberS = await LocalDb().getDoctorPMDCNumber();
  //   UserName = userName ?? '';
  //   PMDCNumber = PMDCNumberS ?? '';
  //   setState(() {});
  // }

  @override
  void initState() {
    // _getimagepath();
    super.initState();
  }

  // String imagepath = '';
  // String? path;

  // _getimagepath() async {
  //   path = (await LocalDb().getDoctorUserImagePath())!;
  //   String baseurl = baseURL;
  //   if (path != null) {
  //     imagepath = baseurl + path!;
  //   }
  // }

  bool isBiometric = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kPrimaryColor,
      body: SafeArea(
        minimum: EdgeInsets.only(left: Get.width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.01,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: ColorManager.kWhiteColor,
                onPressed: () {
                  ZoomDrawer.of(context)!.close();
                },
              ),

              SizedBox(
                height: Get.height * 0.03,
              ),
              // GetBuilder<ProfileController>(builder: (context) {
              //   return ClipRRect(
              //       borderRadius: BorderRadius.circular(30),
              //       child: CircleAvatar(
              //           backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              //           radius: 30,
              //           child: CachedNetworkImage(
              //             imageUrl: ProfileController
              //                         .i.selectedbasicInfo?.picturePath !=
              //                     null
              //                 ? baseURL +
              //                     ProfileController
              //                         .i.selectedbasicInfo?.picturePath
              //                 : "",
              //             imageBuilder: (context, imageProvider) => Container(
              //               decoration: BoxDecoration(
              //                 shape: BoxShape.circle,
              //                 image: DecorationImage(
              //                   image: imageProvider,
              //                   fit: BoxFit.cover, // Adjust the fit property
              //                 ),
              //               ),
              //             ),
              //             //  fit: BoxFit.fitHeight,
              //             errorWidget: (context, url, error) =>
              //                 Image.asset(Images.logo),
              //           )));

              // }),
              CircleAvatar(
                radius: Get.width * 0.1,
                backgroundColor: ColorManager.kWhiteColor,
                backgroundImage: AssetImage(Images.avatar),
              ),
              SizedBox(
                height: Get.height * 0.015,
              ),
              SizedBox(
                width: Get.width * 0.65,
                child: Text(
                  "Obaid",
                  style: GoogleFonts.poppins(
                      color: ColorManager.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Divider(
                thickness: Get.height * 0.002,
                color: ColorManager.kWhiteColor,
              ),

              SizedBox(
                width: Get.width * 0.65,
                child: RichText(
                  text: TextSpan(
                    text: 'RN : ',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.kWhiteColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'A24589',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: Get.height * 0.04,
              ),
              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                leading: Image.asset(
                  Images.biometric,
                  height: Get.height * 0.035,
                ),
                trailing: Transform.scale(
                  scale: 0.55,
                  child: Switch.adaptive(
                      trackOutlineColor: MaterialStateProperty.resolveWith(
                        (final Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return ColorManager.kWhiteColor;
                          }

                          return ColorManager.kWhiteColor;
                        },
                      ),
                      thumbColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return ColorManager.kWhiteColor;
                        }
                        return ColorManager.kWhiteColor;
                      }),
                      activeTrackColor: ColorManager.kWhiteColor.withOpacity(0),
                      inactiveTrackColor:
                          ColorManager.kWhiteColor.withOpacity(0),
                      value: ProfileController.i.fingerprint,
                      onChanged: (val) async {
                        // bool auth = await Authentication.authentication();
                        // if (val == true) {
                        //   if (auth) {
                        //     // authentication = await _authenticate();
                        //     if (auth) {
                        //       if (ProfileController.i.selectedbasicInfo?.id ==
                        //           null) {
                        //         ProfileController.i.fingerprint = auth;
                        //       } else {
                        //         LocalDb.savefingerprint(true);
                        //         // Utils().toastmessage(“You are already Logged in”);
                        //         ProfileController.i.fingerprint = true;
                        //       }
                        //       setState(() {});
                        //     } else {}
                        //     if (ProfileController.i.fingerprint) {
                        //       if (auth) {
                        //         if (ProfileController
                        //                 .i.selectedbasicInfo?.id !=
                        //             null) {
                        //           LocalDb.savefingerprint(true);
                        //           setState(() {
                        //             ProfileController.i.fingerprint = true;
                        //           });
                        //         }
                        //         setState(() {
                        //           ProfileController.i.selectedbasicInfo;
                        //         });
                        //       } else {
                        //         setState(() {
                        //           LocalDb.savefingerprint(true);
                        //           ProfileController.i.fingerprint = true;
                        //         });
                        //       }
                        //     }
                        //   } else {
                        //     setState(() {
                        //       LocalDb.savefingerprint(false);
                        //       ProfileController.i.fingerprint = false;
                        //     });
                        //   }
                        // } else {
                        //   if (auth) {
                        //     LocalDb.savefingerprint(false);
                        //     ProfileController.i.fingerprint = val;
                        //   }
                        //   setState(() {});
                        // }
                      }),
                ),
                title: Text(
                  'biometric'.tr,
                  style: GoogleFonts.poppins(
                    textStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.kWhiteColor,
                    ),
                  ),
                ),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),

              ListTile(
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                leading: Image.asset(
                  Images.language,
                  height: Get.height * 0.035,
                ),
                title: Text(
                  'languages'.tr,
                  style: GoogleFonts.poppins(
                    textStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.kWhiteColor,
                      //  fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () async {
                  await languageSelector(context, AppConstants.languages);
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Divider(
                thickness: Get.height * 0.002,
                color: ColorManager.kWhiteColor,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                width: Get.width * 0.65,
                child: Text(
                  "PrivacyPolicy".tr,
                  style: GoogleFonts.sora(
                    color: ColorManager.kWhiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                width: Get.width * 0.65,
                child: Text(
                  "TermsConditions".tr,
                  style: GoogleFonts.sora(
                    color: ColorManager.kWhiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(
                height: Get.height * 0.22,
              ),

              ListTile(
                leading: Image.asset(
                  Images.logout,
                  height: Get.height * 0.035,
                ),
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                title: Text(
                  'logout'.tr,
                  style: GoogleFonts.poppins(
                    textStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      color: ColorManager.kWhiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                onTap: () async {
                  // ProfileController.i.updatedDoctorInfo(BasicInfo());
                  // AuthController.i.emailController.clear();
                  // AuthController.i.passwordController.clear();
                  // String? id = await LocalDb().getDoctorId();
                  // String? token = await LocalDb().getToken();
                  // bool? loginStatus = await LocalDb().getLoginStatus();
                  // String? DeviceToken = await LocalDb().getDeviceToken();
                  // if (loginStatus ?? true) {
                  //   AuthRepo.logout(
                  //       DoctorId: id,
                  //       token: token,
                  //       DeviceToken: DeviceToken,
                  //       IsLogOffAllDevice: 'false');
                  // }
                  // LocalDb().saveLoginStatus(false);
                  Get.offAll(() => const LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  customListTile(BuildContext context,
      {String? title,
      Function()? onTap,
      Color? textColor = ColorManager.kWhiteColor,
      String? imagePath,
      bool? togglebutton = false,
      bool? isIcon = false,
      bool isImageThere = false}) {
    return ListTile(
        onTap: onTap,
        minLeadingWidth: 20,
        contentPadding: EdgeInsets.zero,
        leading: isIcon == false
            ? Image.asset(imagePath!)
            : const Icon(
                Icons.delete,
                color: ColorManager.kRedColor,
                size: 20,
              ),
        title: Text(
          '$title',
          style:
              Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
        ),
        trailing: togglebutton == true
            ? CupertinoSwitch(value: true, onChanged: (value) {})
            : const SizedBox.shrink());
  }
}

Future<String?> deleteAccount(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) =>
        StatefulBuilder(builder: (context, newState) {
      return AlertDialog(
        backgroundColor: ColorManager.kPrimaryColor,
        title: Text('DeleteAccount'.tr,
            style: GoogleFonts.poppins(
                fontSize: 14, color: ColorManager.kWhiteColor)),
        content: Text('Doyoureallywanttodeleteaccount'.tr,
            style: GoogleFonts.poppins(
                fontSize: 12, color: ColorManager.kWhiteColor)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.kWhiteColor),
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(color: ColorManager.kPrimaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.kWhiteColor),
                      onPressed: () {},
                      child: Text(
                        'delete'.tr,
                        style:
                            const TextStyle(color: ColorManager.kPrimaryColor),
                      )),
                ),
              ],
            ),
          )
        ],
      );
    }),
  );
}
