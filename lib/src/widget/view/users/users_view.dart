import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:reqres/src/model/users/users_model.dart';

import 'package:reqres/src/logic/users/users_controller.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UsersController>();
    final List<User> users = controller.users;
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator()
              : users.isNotEmpty ? CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      title: Text('Users'),
                      centerTitle: true,
                      floating: true,
                    ),
                    SliverList.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        if (index <= users.length - 1 &&
                            controller.isAwait == false) {
                          controller.fetchUsers();
                        }
                        return Card(
                          child: ListTile(
                            onTap: () => Get.toNamed('/user', parameters: {
                              'id': users[index].id.toString()
                            }),
                            title: Text(
                              '${users[index].firstName}  ${users[index].lastName}',
                            ),
                            subtitle: Text(
                              '${users[index].email}',
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(users[index].avatar.toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ) : const Text('Users Not Found'),
        ),
      ),
    );
  }
}
