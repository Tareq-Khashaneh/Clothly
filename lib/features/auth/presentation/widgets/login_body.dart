import 'package:clothly/features/auth/logic/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/custom_field.dart';
import '../../../../core/shared/custom_floating_button.dart';
import '../../../../core/shared/custom_title.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.screenHeight * 0.04,
        ),
        CustomField(
            onChanged: (value) => controller.email = value,
            prefixIcon: const Icon(Icons.email),
            label: "Email",
            hint: "Enter Your email"),
        SizedBox(
          height: Dimensions.screenHeight * 0.03,
        ),
        CustomField(
            validator: (value) {},
            onChanged: (value) => controller.password = value,
            isPassword: true,
            prefixIcon: const Icon(
              Icons.lock,
            ),
            label: "Password",
            hint: "Enter Your Password"),

      ],
    );
  }
}
