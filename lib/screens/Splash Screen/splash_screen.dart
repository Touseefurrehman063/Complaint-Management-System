import 'dart:async';
import 'package:cms_application/localDB/local_db.dart';
import 'package:cms_application/screens/Auth%20Screen/login.dart';
import 'package:cms_application/screens/Dashboard/menu_drawer.dart';
import 'package:cms_application/screens/Welcome%20Screen/welcome_screen.dart';
import 'package:cms_application/utils/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  instance() async {
    // final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

    // await remoteConfig.setConfigSettings(
    //   RemoteConfigSettings(
    //     fetchTimeout: const Duration(seconds: 10),
    //     minimumFetchInterval: const Duration(seconds: 10),
    //   ),
    // );

    // await remoteConfig.fetchAndActivate().then((value) {
    //   baseURL = remoteConfig.getString('URL');
    //   contactnumber = remoteConfig.getString('Phone');

    //   if (baseURL == "") {
    //     baseURL = 'https://patient.helpful.ihealthcure.com/';
    //   }
    // }).onError((error, stackTrace) {
    //   baseURL = 'https://patient.helpful.ihealthcure.com/';
    // });

    //  bool? isFirstStatus ; // correct
    bool? isFirstStatus = true;
    LocalDb().getIsFirstTime()?.then((value) => isFirstStatus = value);
    bool? loginStatus;
    LocalDb().getLoginStatus()?.then((value) => loginStatus = value);
    Future.delayed(const Duration(milliseconds: 2000)).then((value) async {
      if (isFirstStatus != null && isFirstStatus == false) {
        if (loginStatus == true) {
          Get.offAll(() => const DrawerScreen());
        } else {
          Get.offAll(() => const LoginScreen());
        }
      } else {
        Get.offAll(() => const WelcomeScreen());
      }
    });
  }

  @override
  void initState() {
    instance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.backgroundimage),
        ),
      ),
      child: SlideTransitions(
        image: Center(child: Image.asset(Images.logo)),
      ),
    ));
  }
}

class SlideTransitions extends StatefulWidget {
  final Widget? image;
  const SlideTransitions({super.key, this.image});

  @override
  State<SlideTransitions> createState() => _SlideTransitionsState();
}

class _SlideTransitionsState extends State<SlideTransitions>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(padding: const EdgeInsets.all(8.0), child: widget.image),
    );
  }
}
