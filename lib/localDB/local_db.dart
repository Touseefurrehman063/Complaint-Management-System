import 'dart:convert';
import 'dart:developer';
import 'package:cms_application/models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  setLanguage(LanguageModel? language) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('language', jsonEncode(language));
  }

  Future<LanguageModel?> getLanguage() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? data = s.getString("language");
    LanguageModel? lang;
    if (data != null) {
      lang = LanguageModel.fromJson(jsonDecode(data));
    } else {
      lang = null;
    }
    return lang;
  }

  removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('Onlinestatus');
    prefs.remove('status');
    prefs.remove('Onlinestatus');
  }

  static savefingerprint(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('fingerprint', val);
  }

  static getfingerprint() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool returnvalue = prefs.getBool('fingerprint') ?? false;
    return returnvalue;
  }

  saveIsFirstTime(bool? isFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.setBool('IsFirstTime', isFirstTime!);
    log('IsFirstTime $result');
  }

  Future<bool?>? getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool('IsFirstTime');
    return result;
  }

  saveUserId(String? UserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('UserId', '$UserId');
  }

  Future<String?>? getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString('UserId');
    return result ?? "";
  }

  saveToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.setString('token', '$token');
    log('token is  $result');
  }

  Future<String?>? getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString('token');
    return result;
  }

  saveLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.setBool('status', status);
    log('patientId $result');
  }

  Future<bool?>? getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool('status');
    return result;
  }

  saveDeviceToken(String? token) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('devicetoken', token.toString());
  }

  Future<String> getDeviceToken() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String? token = s.getString('devicetoken');
    String receivedToken = token ?? "";
    return receivedToken;
  }
}
