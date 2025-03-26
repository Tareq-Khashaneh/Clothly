import 'package:clothly/features/auth/logic/auth_controller.dart';
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
    return Column(
      children: [
        SizedBox(
          height: Dimensions.screenHeight * 0.04,
        ),
        CustomField(
            validator: (value) {},
            onChanged: (value) => controller.fullName = value,
            prefixIcon: const Icon(Icons.person),
            label: "FullName",
            hint: "Enter Your Full name"),
        SizedBox(
          height: Dimensions.screenHeight * 0.03,
        ),

        CustomField(
            validator: (value) {
              final phoneNumberRegex = RegExp(r'^\+?[1-9]{1}[0-9]{7,14}$');
              if (value == null || value.isEmpty) {
                return 'Phone number is required';
              } else if (!phoneNumberRegex.hasMatch(value)) {
                return 'Please enter a valid international phone number.';
              }
              return null;
            },
            onChanged: (value) => controller.phoneNumber = value,
            prefixIcon: const Icon(Icons.phone),
            label: "Phone Number",
            hint: "Enter Your Phone number"),
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
            validator: (value) {

              if (value != controller.password) {
                return "Passwords do not match";
              }
              return null;
            },
            onChanged: (value) => controller.confirmPassword = value,
            isPassword: true,
            prefixIcon: const Icon(Icons.lock),
            label: "Confirm Password",
            hint: "Enter Your Password"),

      ],
    );
  }
}
