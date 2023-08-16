import 'package:get/get.dart';

import 'package:flutter/material.dart';

import 'package:reqres/src/logic/controller_binding.dart';

import 'package:reqres/src/widget/view/users/users_view.dart';
import 'package:reqres/src/widget/view/user_details/user_details_view.dart';

import 'package:reqres/src/data/repository/user_repository_impl.dart';
import 'package:reqres/src/data/repository/users_repository_impl.dart';

import 'package:reqres/src/data/provider/users_storage_impl.dart';
import 'package:reqres/src/data/provider/user_storage_impl.dart';
import 'package:reqres/src/data/provider/users_network_data_provider_impl.dart';
import 'package:reqres/src/data/provider/user_network_data_provider_impl.dart';

import 'package:reqres/src/data/client/http_client.dart';

import 'package:reqres/src/data/client/key_value_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final httpClient = HTTPClient.getInstance();
    final keyValueStorage = KeyValueStorage.getInstance();

    return GetMaterialApp(
      title: 'Reqres',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: ControllerBinding(
        usersRepository: UsersRepositoryImpl(
          usersNetworkDataProvider: UsersNetworkDataProviderImpl(
            httpClient: httpClient,
          ),
          usersStorage: UsersStorageImpl(keyValueStorage: keyValueStorage),
        ),
        userRepository: UserRepositoryImpl(
          userNetworkDataProvider: UserNetworkDataProviderImpl(
            httpClient: httpClient,
          ),
          userStorage: UserStorageImpl(keyValueStorage: keyValueStorage),
        ),
      ),
      initialRoute: '/users',
      getPages: [
        GetPage(
          name: '/users',
          page: () => const UsersView(),
        ),
        GetPage(
          name: '/user',
          page: () => const UserDetailsView(),
        ),
      ],
    );
  }
}
