import 'dart:async';
import 'package:clothly/core/constants/images.dart';
import 'package:clothly/features/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AppService appService;
  @override
  void initState() {

    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 4000)).then((value) {
      Get.offNamed(AppRoutes.authRoute);
    });
    appService = Get.find();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircleAvatar(
          radius: Get.size.height * 0.1,
          backgroundImage: appService.logoImage !=null? NetworkImage(appService.logoImage!) : const AssetImage(defaultImage),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
