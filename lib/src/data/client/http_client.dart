import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:reqres/src/utils/constants/strings.dart';

class HTTPClient {
  static final HTTPClient _instance = HTTPClient._();

  HTTPClient._();

  static HTTPClient getInstance() {
    return _instance;
  }

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await http.get(
        Uri.https(host, endpoint, queryParameters),
      );
      return jsonDecode(response.body);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
