import 'package:reqres/src/data/client/http_client.dart';

import 'package:reqres/src/model/users/users_model.dart';

import 'package:reqres/src/data/provider/users_network_data_provider.dart';

class UsersNetworkDataProviderImpl implements UsersNetworkDataProvider {
  final HTTPClient _httpClient;

  const UsersNetworkDataProviderImpl({
    required HTTPClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<UsersModel> fetchUsers({required int page}) async {
    final response = await _httpClient
        .get(endpoint: 'api/users', queryParameters: {'page': page.toString()});
    return UsersModel.fromJson(response);
  }
}
