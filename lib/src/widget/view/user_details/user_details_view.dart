import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:reqres/src/logic/user_details/user_details_controller.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserDetailsController>();
    return Scaffold(
      body: Center(
        child: Obx(() => controller.isLoading.value
            ? const CircularProgressIndicator()
            : controller.user != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.user?.value?.avatar.toString() ?? ''),
                      ),
                      Text(controller.user?.value?.id.toString() ?? ''),
                      Text(controller.user?.value?.firstName ?? ''),
                      Text(controller.user?.value?.lastName ?? ''),
                      Text(controller.user?.value?.email ?? ''),
                    ],
                  )
                : const Text('User Not Found')),
      ),
    );
  }
}
