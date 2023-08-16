import 'package:reqres/src/model/user/user_model.dart';

abstract class UserRepository {
  Future<UserDetail?> fetchUser({required String uid});
}
