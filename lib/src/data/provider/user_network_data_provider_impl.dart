import 'package:reqres/src/model/user/user_model.dart';

import 'package:reqres/src/data/client/http_client.dart';

import 'package:reqres/src/data/provider/user_network_data_provider.dart';

class UserNetworkDataProviderImpl implements UserNetworkDataProvider {
  final HTTPClient _httpClient;

  const UserNetworkDataProviderImpl({
    required HTTPClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<UserModel> fetchUser({required String uid}) async {
    final response = await _httpClient.get(endpoint: 'api/users/$uid');
    return UserModel.fromJson(response);
  }
}
