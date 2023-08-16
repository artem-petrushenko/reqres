import 'package:get/get.dart';

import 'package:reqres/src/model/users/users_model.dart';

import 'package:reqres/src/data/repository/users_repository.dart';

class UsersController extends GetxController {
  final UsersRepository _usersRepository;

  UsersController({
    required UsersRepository usersRepository,
  }) : _usersRepository = usersRepository;

  bool isAwait = true;
  RxBool isLoading = false.obs;
  RxList<User> users = <User>[].obs;
  int page = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(false);
      isAwait = true;
      final response = await _usersRepository.fetchUsers(page: page);
      if (response.isNotEmpty) {
        users.addAll(response);
        page++;
      }
      isAwait = false;
    } catch (e) {
      isLoading(true);
    }
  }
}
