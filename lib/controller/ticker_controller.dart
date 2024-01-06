import 'package:cms_application/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

class TicketController extends GetxController implements GetxService {
  static TicketController get i => Get.put(TicketController());

  final dateFormatalert = DateFormat('yyyy-MM-dd');
  DateTime dateTimealert = DateTime.now().subtract(const Duration(days: 30));
  // DateTime dateTimealert = DateTime.now();
  DateTime dateTime2alert = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    addinContainerList();
  }

  List<Containers> containerList = [];

  addinContainerList() {
    containerList.clear();
    containerList.add(
      Containers(
        name: "Overall".tr,
        count: "20",
        color: ColorManager.kPrimaryOverallColor.withOpacity(0.7),
      ),
    );
    containerList.add(
      Containers(
        name: "Pending".tr,
        count: "5",
        color: ColorManager.kPrimarypendingColor,
      ),
    );
    containerList.add(
      Containers(
        name: "InProgress".tr,
        count: "5",
        color: ColorManager.kPrimaryinprogressColor,
      ),
    );
    containerList.add(
      Containers(
        name: "Cancel".tr,
        count: "5",
        color: ColorManager.kPrimarycancelColor,
      ),
    );
    containerList.add(
      Containers(
        name: "Completed".tr,
        count: "5",
        color: ColorManager.kPrimarycompleteColor,
      ),
    );
    update();
  }
}

class Containers {
  String name;
  String count;
  Color color;

  Containers({required this.name, required this.count, required this.color});
}
