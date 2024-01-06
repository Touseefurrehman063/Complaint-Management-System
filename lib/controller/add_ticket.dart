import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTicketController extends GetxController implements GetxService {
  late TextEditingController subjectController;
  late TextEditingController descriptionController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    subjectController = TextEditingController();
    descriptionController = TextEditingController();
  }

  static AddTicketController get i => Get.put(AddTicketController());
}
