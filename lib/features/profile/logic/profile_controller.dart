import 'package:clothly/features/auth/data/models/user_model.dart';
import 'package:clothly/features/profile/data/providers/profile_pro.dart';
import 'package:clothly/features/profile/data/repositories/profile_repo.dart';
import 'package:clothly/features/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  final AppService appService = Get.find();
  late ProfilePro profilePro;
  @override
  void onInit() {
    super.onInit();
    profilePro = ProfilePro(
        profileRepo: ProfileRepo(networkService: appService.networkService));
  print("current user ${appService.currentUser}");
    fullNameController = TextEditingController(text:    appService.currentUser?.fullName ?? '');
    emailController = TextEditingController(text:    appService.currentUser?.email ?? '');
    phoneController = TextEditingController(text:    appService.currentUser?.phone ?? '');
  }

  Future<bool> updateProfile() async {
    try {
      UserModel? user = await profilePro.update(params: {
        'email': emailController.text,
        'full_name': fullNameController.text,
        'phone_number': phoneController.text,
      });
      if (user != null) {
        appService.currentUser = user;
        update();
        return true;
      }
    } catch (e) {
      print("error in profile controller ${e.toString()}");
    }
    return false;
  }
}
