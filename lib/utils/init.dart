import 'package:cms_application/controller/language_controller.dart';
import 'package:cms_application/controller/profile_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController());
    Get.put<LanguageController>(LanguageController());
  }
}
