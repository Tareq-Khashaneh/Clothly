import 'package:clothly/core/shared/bottom_nav_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body, required this.pageIndex});
final Widget body;
final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: body,
      bottomNavigationBar: BottomNavBarWidget(pageIndex: pageIndex),
    ));
  }
}
