import 'package:reqres/src/model/users/users_model.dart';

abstract class UsersRepository {
  Future<List<User>> fetchUsers({required int page});
}
