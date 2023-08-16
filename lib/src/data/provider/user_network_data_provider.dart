import 'package:reqres/src/model/user/user_model.dart';

abstract class UserNetworkDataProvider {
  Future<UserModel> fetchUser({required String uid});
}
