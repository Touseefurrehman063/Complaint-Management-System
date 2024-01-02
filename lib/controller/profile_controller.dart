import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController implements GetxService {
  static ProfileController get i => Get.put(ProfileController());

  final zoomDrawerController = ZoomDrawerController();

  bool fingerprint = false;
  updatefingerprint(val) {
    fingerprint = val;
    update();
  }

  int selectedPage = 0;
  updateselectedPage(val) {
    selectedPage = val;
    update();
  }

  bool editval = false;
  updateval(bool ret) {
    editval = ret;
    update();
  }

  bool addval = false;
  updateaddval(bool ret) {
    addval = ret;
    update();
  }

  bool isEdit = false;
  updateisEdit(value) {
    isEdit = value;
    update();
  }

  int pageIndex = 0;

  var status = "iamoffline".tr;
  var value = 0;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  updateIsloading(bool value) {
    _isLoading = value;
    update();
  }

  int tabindex = 0;

  updateselectedindex(int ind) {
    tabindex = ind;

    ProfileController.i.updateval(false);
    ProfileController.i.updateaddval(false);
    update();
  }

  int pageindex = 0;
  updatepageindex(index) {
    pageIndex = index;
    update();
  }
}
