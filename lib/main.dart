import 'dart:async';
import 'dart:io';
import 'package:cms_application/controller/language_controller.dart';
import 'package:cms_application/localDB/local_db.dart';
import 'package:cms_application/models/language_model.dart';
import 'package:cms_application/screens/Splash%20Screen/splash_screen.dart';
import 'package:cms_application/utils/constants.dart';
import 'package:cms_application/utils/init.dart';
import 'package:cms_application/utils/languages.dart';
import 'package:cms_application/utils/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await NotificationsRepo().setupInteractMessage();
  // await NotificationsRepo().initNotifications();
  // await NotificationsRepo().firebaseInit();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // DependencyInjection.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    getLocale();

    super.initState();
  }

  getLocale() async {
    LanguageModel? lang = await LocalDb().getLanguage();

    if (lang == null) {
      lang = LanguageModel(
          id: 1,
          name: 'English',
          image: null,
          locale: const Locale('en', 'US'));
      Get.updateLocale(lang.locale!);
      LanguageController.i.selected = AppConstants.languages[0];
    } else {
      Get.updateLocale(lang.locale!);
    }

    if (lang.id == 1) {
      LanguageController.i.selected = AppConstants.languages[0];
    } else if (lang.id == 2) {
      LanguageController.i.selected = AppConstants.languages[1];
    } else {
      LanguageController.i.selected = AppConstants.languages[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.ltr,
      translations: Localization(),
      locale: const Locale('en', 'US'),
      theme: Styles.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      initialBinding: AppBindings(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
