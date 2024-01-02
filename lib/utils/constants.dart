import 'package:cms_application/models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String baseURL = '';
String contactnumber = '';
String appName = "Complaint Management System";

class AppConstants {
  static String updateimage = '$baseURL/api/doctor/UpdateImage';

  static List<LanguageModel> languages = [
    LanguageModel(name: 'English', id: 1, locale: const Locale('en', 'US')),
    LanguageModel(name: 'عربي'.tr, id: 2, locale: const Locale('ar', 'SA')),
    LanguageModel(name: 'اردو'.tr, id: 3, locale: const Locale('ur', 'PK')),
  ];
}
