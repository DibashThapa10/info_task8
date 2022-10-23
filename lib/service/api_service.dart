import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import 'package:task8/model/response.dart';
import 'package:task8/service/api_client.dart';

class ApiService {
  Future<UserResponseModel> createUser(
      {required Map<String, dynamic> userModel}) async {
    Response result = await ApiClient().request(
      methodType: "post",
      endPoint: "https://www.wedothakre.com/api/submit",
      data: userModel,
    );
    if (result.statusCode == 200) {
      log(result.body.toString());
      return UserResponseModel.fromJson(json: jsonDecode(result.body));
    } else {
      throw Exception("Failed to Send Data");
    }
  }
}
