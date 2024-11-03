

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../home/presentation/screens/home_screen.dart';


class BottomNavBarController extends GetxController{
    final List<Widget> screens = [
    const HomeScreen(),
    ];
  late int selectedIndex = 0;
  void changeIndex({required int index}){
    selectedIndex = index;
    update();
  }
}