import 'package:reqres/src/model/users/users_model.dart';

abstract class UsersStorage {
  Future<void> writeUsers({required List<User> users});

  Future<List<User>> readUsers();
}
