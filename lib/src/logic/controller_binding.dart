import 'package:get/get.dart';

import 'package:reqres/src/logic/users/users_controller.dart';

import 'package:reqres/src/data/repository/users_repository.dart';

class ControllerBinding implements Bindings {
  final UsersRepository _usersRepository;

  ControllerBinding({
    required UsersRepository usersRepository,
  })  : _usersRepository = usersRepository;

  @override
  void dependencies() {
    Get.lazyPut(() => UsersController(usersRepository: _usersRepository));
  }
}
