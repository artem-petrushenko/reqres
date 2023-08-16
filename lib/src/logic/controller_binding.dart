import 'package:get/get.dart';

import 'package:reqres/src/logic/user_details/user_details_controller.dart';
import 'package:reqres/src/logic/users/users_controller.dart';

import 'package:reqres/src/data/repository/user_repository.dart';
import 'package:reqres/src/data/repository/users_repository.dart';

class ControllerBinding implements Bindings {
  final UsersRepository _usersRepository;
  final UserRepository _userRepository;

  ControllerBinding({
    required UsersRepository usersRepository,
    required UserRepository userRepository,
  })  : _usersRepository = usersRepository,
        _userRepository = userRepository;

  @override
  void dependencies() {
    Get.lazyPut(() => UsersController(usersRepository: _usersRepository));
    Get.lazyPut(() => UserDetailsController(userRepository: _userRepository),
        fenix: true);
  }
}
