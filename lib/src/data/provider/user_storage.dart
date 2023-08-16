import 'package:reqres/src/model/user/user_model.dart';

abstract class UserStorage {
  Future<void> writeUser({required UserDetail user});

  Future<UserDetail?> readUser({required String id});
}
