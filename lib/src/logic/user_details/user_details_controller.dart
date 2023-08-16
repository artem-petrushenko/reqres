import 'package:get/get.dart';

import 'package:reqres/src/data/repository/user_repository.dart';

import 'package:reqres/src/model/user/user_model.dart';

class UserDetailsController extends GetxController {
  final String uid = Get.parameters['id'] ?? '';
  final UserRepository _userRepository;

  UserDetailsController({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  RxBool isLoading = false.obs;
  Rx<UserDetail?>? user;

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      isLoading(true);
      final response = await _userRepository.fetchUser(uid: uid);
      user = response.obs;
      isLoading(false);
    } catch (e) {
      isLoading(true);
    }
  }
}
