import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:frenzi/feature/login/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class LoginRemoteSource {
  LoginRemoteSource(this._httpClient);

  final Dio _httpClient;

  http.Client client = http.Client();

  Future<UserModel> login(String email, String password) async {
    try {
      // final response = await _httpClient.post<Map<String, dynamic>>(
      //   'api/login',
      //   options: Options(
      //     responseType: ResponseType.plain,
      //   ),
      // );
      // if (response.statusCode == 200) {
      //   final body = response.data ?? {};
      //
      //   final result = UserModel.fromJson(body);
      //   return result;
      // } else {
      //   return const UserModel.empty();
      // }

      String response = await rootBundle.loadString(
        'assets/sample_json/user_response.json',
      );
      Map<String, dynamic> jsonBody = json.decode(response);

      final result = UserModel.fromJson(jsonBody);
      return result;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
