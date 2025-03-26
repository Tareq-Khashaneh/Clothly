import 'package:clothly/features/auth/presentation/widgets/login_body.dart';
import 'package:clothly/features/auth/presentation/widgets/signup_body.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/custom_floating_button.dart';
import '../../logic/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("logo ${controller.appService.logoImage}");
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: Dimensions.screenHeight * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black
                      .withOpacity(0.2), // Adjust opacity to control darkness
                  BlendMode.darken, // Blend mode to make the background darker
                ),
                image: controller.appService.logoImage == null
                    ? const AssetImage(
                        "assets/images/logo.jpg",
                      )
                    : NetworkImage(controller.appService.logoImage!)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Dimensions.screenHeight * 0.38),
          child: Container(
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
                border: Border.all(color: Colors.transparent)),
            child: ListView(
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
                  icons: const [Icons.login_rounded, Icons.person_add_rounded],
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
                      : SignupBody();
                }),
                SizedBox(
                  height: Dimensions.screenHeight * .03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomFloatingButton(
                      onTap: () async {
                        if (controller.selectedIndex == 1) {
                          if (await controller.signup()) {
                            Get.offNamed(AppRoutes.homeRoute,
                                arguments: {'user': controller.userModel});
                          }
                        } else {
                          if (await controller.login()) {
                            Get.offNamed(
                              AppRoutes.homeRoute,
                            );
                          }
                        }
                      },
                      width: Dimensions.screenWidth * 0.4,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Text(
                          "Let's Shop",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    )));
  }
}
