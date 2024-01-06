import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService {
  late TextEditingController ticketSearchController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ticketSearchController = TextEditingController();
  }

  static HomeController get i => Get.put(HomeController());
}
