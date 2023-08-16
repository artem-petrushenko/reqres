import 'package:reqres/src/model/users/users_model.dart';

abstract class UsersNetworkDataProvider {
  Future<UsersModel> fetchUsers({required int page});
}
