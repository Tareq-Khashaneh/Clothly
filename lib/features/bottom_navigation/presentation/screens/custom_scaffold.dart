import 'package:ecommerce_clothing/core/constants/app_colors.dart';
import 'package:ecommerce_clothing/features/bottom_navigation/logic/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_nav_widget.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold(
      {super.key,
      required this.body,
      required this.pageIndex,
      this.isHaveBottomNav = false});
  final Widget body;
  final int pageIndex;
  bool isHaveBottomNav;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: body,
            bottomNavigationBar: isHaveBottomNav
                ? BottomNavBarWidget(
                    pageIndex: pageIndex,
                  )
                : null));
  }
}
