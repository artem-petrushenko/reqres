import 'package:reqres/src/model/users/users_model.dart';

abstract class UsersStorage {
  Future<void> writeUsers({required int page, required List<User> users});

  Future<List<User>> readUsers({required int page, required int pageSize});
}
