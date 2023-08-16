import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:reqres/src/model/users/users_model.dart';

import 'package:reqres/src/data/repository/users_repository.dart';

import 'package:reqres/src/data/provider/users_network_data_provider.dart';

@immutable
class UsersRepositoryImpl implements UsersRepository {
  final UsersNetworkDataProvider _usersNetworkDataProvider;

  const UsersRepositoryImpl({
    required UsersNetworkDataProvider usersNetworkDataProvider,
  }) : _usersNetworkDataProvider = usersNetworkDataProvider;

  @override
  Future<List<User>> fetchUsers({required int page}) async {
    final response = await _usersNetworkDataProvider.fetchUsers(page: page);
    return response.data;
  }
}
