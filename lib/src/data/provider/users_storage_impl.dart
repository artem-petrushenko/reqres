import 'dart:convert';

import 'package:reqres/src/data/provider/users_storage.dart';

import 'package:reqres/src/data/client/key_value_storage.dart';
import 'package:reqres/src/model/users/users_model.dart';

class UsersStorageImpl implements UsersStorage {
  final KeyValueStorage _keyValueStorage;

  const UsersStorageImpl({
    required KeyValueStorage keyValueStorage,
  }) : _keyValueStorage = keyValueStorage;

  @override
  Future<List<User>> readUsers({
    required int page,
    required int pageSize,
  }) async {
    final userListStrings = await _keyValueStorage.getStringList('users$page');
    if (userListStrings == null) {
      return [];
    }
    final List<User> userList = userListStrings.map((userString) {
      return User.fromJson(jsonDecode(userString) as Map<String, dynamic>);
    }).toList();
    return userList;
  }

  @override
  Future<void> writeUsers(
      {required int page, required List<User> users}) async {
    final usersString = users.map((e) => jsonEncode(e)).toList();
    await _keyValueStorage.setStringList('users$page', usersString);
  }
}
