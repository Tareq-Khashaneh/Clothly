import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/routes.dart';
import 'features/service/app_service.dart';
import 'features/bottom_navigation/logic/bottom_nav_bindings.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       fontFamily: 'Encode_Sans'
      ),
    initialBinding: BottomNavBarBindings(),
    initialRoute: AppRoutes.splash,
    getPages: AppRoutes.pages,
    );
  }
}

