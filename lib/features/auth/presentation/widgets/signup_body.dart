import 'package:ecommerce_clothing/features/auth/logic/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/custom_field.dart';
import '../../../../core/shared/custom_floating_button.dart';

class SignupBody extends StatelessWidget {
  SignupBody({super.key});
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.screenHeight * 0.04,
          ),
          CustomField(
              validator: (value) {},
              onChanged: (value) => controller.username = value,
              prefixIcon: const Icon(Icons.person),
              label: "Username",
              hint: "Enter Your name"),
          SizedBox(
            height: Dimensions.screenHeight * 0.03,
          ),
          CustomField(
              validator: (value) {},
              onChanged: (value) => controller.email = value,
              prefixIcon: const Icon(Icons.email),
              textInputType: TextInputType.emailAddress,
              label: "Email",
              hint: "Enter Your email"),
          SizedBox(
            height: Dimensions.screenHeight * 0.03,
          ),
          CustomField(
              validator: (value) {},
              onChanged: (value) => controller.password = value,
              isPassword: true,
              prefixIcon: const Icon(Icons.lock),
              label: "Password",
              hint: "Enter Your Password"),
          SizedBox(
            height: Dimensions.screenHeight * 0.03,
          ),
          CustomField(
              validator: (value) {},
              onChanged: (value) => controller.confirmPassword = value,
              isPassword: true,
              prefixIcon: const Icon(Icons.lock),
              label: "Confirm Password",
              hint: "Enter Your Password"),
          SizedBox(
            height: Dimensions.screenHeight * .03,
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomRight,
              child: CustomFloatingButton(
                onTap: () async {
                  if (await controller.register()) {
                    Get.offNamed(AppRoutes.homeRoute);
                  }
                },
                width: Dimensions.screenWidth * 0.4,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's Shop",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
