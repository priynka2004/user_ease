import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:user_ease/model/user_model.dart';
import 'package:user_ease/shared/api_end_point.dart';

class UserEaseApiService {
  static Future<List<UserEase>> getUserEase() async {
    http.Response response = await http.get(
      Uri.parse(ApiEndPoint.baseUrl()),
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }

      final List<dynamic> jsonResponse = jsonDecode(response.body);
      final List<UserEase> userEase = jsonResponse.map((data) {
        return UserEase.fromJson(data);
      }).toList();

      return userEase;
    } else {
      throw 'Something went wrong';
    }
  }
}
