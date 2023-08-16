import 'dart:convert';

import 'package:reqres/src/data/client/key_value_storage.dart';
import 'package:reqres/src/data/provider/user_storage.dart';
import 'package:reqres/src/model/user/user_model.dart';

class UserStorageImpl implements UserStorage {
  final KeyValueStorage _keyValueStorage;

  const UserStorageImpl({
    required KeyValueStorage keyValueStorage,
  }) : _keyValueStorage = keyValueStorage;

  @override
  Future<UserDetail?> readUser({required String id}) async {
    final value = await _keyValueStorage.getString('user$id');
    return UserDetail.fromJson(jsonDecode(value ?? '') as Map<String, dynamic>);
  }

  @override
  Future<void> writeUser({required UserDetail user}) async {
    final value = jsonEncode(user.toJson());
    await _keyValueStorage.setString('user${user.id}', value);
  }
}
