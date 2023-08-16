import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:reqres/src/data/provider/user_storage.dart';

import 'package:reqres/src/model/user/user_model.dart';

import 'package:reqres/src/data/repository/user_repository.dart';

import 'package:reqres/src/data/provider/user_network_data_provider.dart';

@immutable
class UserRepositoryImpl implements UserRepository {
  final UserNetworkDataProvider _userNetworkDataProvider;
  final UserStorage _userStorage;

  const UserRepositoryImpl({
    required UserNetworkDataProvider userNetworkDataProvider,
    required UserStorage userStorage,
  })  : _userNetworkDataProvider = userNetworkDataProvider,
        _userStorage = userStorage;

  @override
  Future<UserDetail?> fetchUser({required String uid}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      final response = await _userNetworkDataProvider.fetchUser(uid: uid);
      final userDetail = response.data;
      if (userDetail != null) {
        await _userStorage.writeUser(user: userDetail);
      }
      return userDetail;
    } else {
      final response = _userStorage.readUser(id: uid);
      return response;
    }
  }
}
