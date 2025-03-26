import 'package:clothly/core/constants/routes.dart';
import 'package:clothly/core/shared/bottom_nav_widget.dart';
import 'package:clothly/core/shared/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../logic/profile_controller.dart';
import '../widgets/profile_option.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      pageIndex: 3,
            body: GetBuilder<ProfileController>(builder: (controller) {
              if (controller.appService.currentUser != null) {
                return Column(
                  children: [
                    // Profile Header
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 150,
                          alignment: Alignment.bottomRight,
                          width: Get.size.width,
                          padding: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: AppColors.kMainColorBlack,
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(20)),
                          ),
                          // child: IconButton(onPressed: (){}, icon: const Icon(Icons.edit_rounded,)
                          // ),
                        ),
                        const Positioned(
                          top: 100,
                          child: CircleAvatar(
                            radius: 48,
                            backgroundImage: AssetImage(
                                'assets/images/p1.jpg'), // Replace with network image if needed
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60), // To avoid overlap

                    // Name & Email
                    Text(controller.appService.currentUser?.fullName ?? '',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text(controller.appService.currentUser?.email ?? '',
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                    const SizedBox(height: 10),
                    Text(controller.appService.currentUser?.phone ?? '',
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[600])),
                    const SizedBox(height: 10),
                    // Edit Profile Button
                    ElevatedButton(
                      onPressed: () => Get.toNamed(AppRoutes.editProfileRoute),
                      child: const Text("Edit Profile",
                          style: TextStyle(
                            fontSize: 16,
                          )),
                    ),

                    const SizedBox(height: 20),

                    // Settings List
                    Expanded(
                      child: ListView(
                        children: [
                          ProfileOption(
                              icon: Icons.logout, text: "Logout", onTap: () {}),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            }));
  }
}
