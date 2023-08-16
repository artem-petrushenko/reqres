import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:reqres/src/data/provider/users_storage.dart';

import 'package:reqres/src/model/users/users_model.dart';

import 'package:reqres/src/data/repository/users_repository.dart';

import 'package:reqres/src/data/provider/users_network_data_provider.dart';

@immutable
class UsersRepositoryImpl implements UsersRepository {
  final UsersNetworkDataProvider _usersNetworkDataProvider;
  final UsersStorage _usersStorage;

  const UsersRepositoryImpl({
    required UsersNetworkDataProvider usersNetworkDataProvider,
    required UsersStorage usersStorage,
  })  : _usersNetworkDataProvider = usersNetworkDataProvider,
        _usersStorage = usersStorage;

  @override
  Future<List<User>> fetchUsers({required int page}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      final response = await _usersNetworkDataProvider.fetchUsers(page: page);
      final users = response.data;
      if (users.isNotEmpty) {
        await _usersStorage.writeUsers(users: users, page: page);
      }
      return users;
    } else {
      final response = _usersStorage.readUsers(page: page, pageSize: 6);
      return response;
    }
  }
}
