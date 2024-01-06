import 'package:cms_application/models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String baseURL = 'http://192.168.88.254:324';
String contactnumber = '';
String appName = "Complaint Management System";

class AppConstants {
  static String updateimage = '$baseURL/api/doctor/UpdateImage';
  static String getCountries = '$baseURL/api/ddl/GetCountries';
  static String getProvince = '$baseURL/api/ddl/GetStateOrProvinces';
  static String getCities = '$baseURL/api/ddl/GetCities';

  static List<LanguageModel> languages = [
    LanguageModel(name: 'English', id: 1, locale: const Locale('en', 'US')),
    LanguageModel(name: 'عربي'.tr, id: 2, locale: const Locale('ar', 'SA')),
    LanguageModel(name: 'اردو'.tr, id: 3, locale: const Locale('ur', 'PK')),
  ];
}
