import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:reqres/src/model/user/user_model.dart';

import 'package:reqres/src/data/repository/user_repository.dart';

import 'package:reqres/src/data/provider/user_network_data_provider.dart';

@immutable
class UserRepositoryImpl implements UserRepository {
  final UserNetworkDataProvider _userNetworkDataProvider;

  const UserRepositoryImpl({
    required UserNetworkDataProvider userNetworkDataProvider,
  }) : _userNetworkDataProvider = userNetworkDataProvider;

  @override
  Future<UserDetail?> fetchUser({required String uid}) async {
    final response = await _userNetworkDataProvider.fetchUser(uid: uid);
    return response.data;
  }
}
