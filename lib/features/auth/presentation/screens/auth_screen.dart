
import 'package:ecommerce_clothing/features/auth/presentation/widgets/login_body.dart';
import 'package:ecommerce_clothing/features/auth/presentation/widgets/signup_body.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/shared/custom_title.dart';
import '../../logic/auth_controller.dart';


class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: Dimensions.screenHeight * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                          0.5), // Adjust opacity to control darkness
                      BlendMode
                          .darken, // Blend mode to make the background darker
                    ),
                    image: AssetImage("assets/images/shopping.jpg")),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimensions.screenHeight * .15),
          child: Align(
              alignment: Alignment.topCenter,
              child: CustomTitle(
                text: "Fashion",
                fontSize: Dimensions.screenHeight * 0.05,
                color: Colors.white,
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: Dimensions.screenHeight * 0.6,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.screenWidth * 0.05,
                      vertical: Dimensions.screenHeight * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius05),
                          topLeft: Radius.circular(Dimensions.radius05)),
                      border: Border.all()),
                  child: Column(
                    children: [
                      ToggleSwitch(
                        minHeight: Dimensions.screenHeight * 0.055,
                        minWidth: Dimensions.screenWidth * 0.46,
                        initialLabelIndex: 0,
                        cornerRadius: Dimensions.radius05,
                        activeFgColor: Colors.white,
                        inactiveBgColor: AppColors.kSecondColorGrey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        iconSize: Dimensions.screenHeight * 0.025,
                        fontSize: Dimensions.screenHeight * 0.025,
                        labels: const ['Login', 'SignUp'],
                        radiusStyle: true,
                        icons: const [Icons.login, Icons.e_mobiledata],
                        activeBgColors: [
                          [AppColors.kMainColorBlack],
                          [AppColors.kMainColorBlack]
                        ],
                        onToggle: (index) {
                          controller.changeIndex(index: index!);
                        },
                      ),
                      GetBuilder<AuthController>(builder: (controller) {
                        return controller.selectedIndex == 0
                            ? LoginBody()
                            :  SignupBody();
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    )));
  }
}
