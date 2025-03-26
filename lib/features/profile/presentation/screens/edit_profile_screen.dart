import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/custom_field.dart';
import '../../logic/profile_controller.dart';

class EditProfileScreen extends GetView<ProfileController> {
  EditProfileScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Pre-fill existing data

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Edit Profile",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomField(
                    controller: controller.fullNameController..text,
                    validator: (value) {
                      if (value != null) {
                        if (value.isNotEmpty) {}
                        return "Empty Value";
                      }
                    },
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    label: "FullName",
                    hint: ""),
                CustomField(
                    controller: controller.emailController..text,
                    validator: (value) {
                      if (value != null) {
                        if (value.isNotEmpty) {}
                        return "Empty Value";
                      }
                    },
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    label: "Email",
                    hint: ""),
                CustomField(
                    controller: controller.phoneController..text,
                    validator: (value) {
                      if (value != null) {
                        if (value.isNotEmpty) {}
                        return "Empty Value";
                      }
                    },
                    prefixIcon: const Icon(
                      Icons.phone,
                    ),
                    label: "PhoneNumber",
                    hint: ""),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) {
                      // Update Profile Info in GetX Controller
                      if (await controller.updateProfile()) {
                        Get.back(); // Return to Profile Screen
                      }
                    }
                  },
                  child: const Text("Save Changes",
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
