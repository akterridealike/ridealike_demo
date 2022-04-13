import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/helpers/local_data_store.dart';

import '../app_constants.dart';
import '../data_model/update_email_response.dart';
import '../data_model/user_response.dart';
import '../helpers/api_client.dart';

class ApiRepository{
  Future<UserResponse> getUserData(
      BuildContext context, dynamic data) async {
    try {
      final response = await ApiClient.post(AppConstant.getProfileUrl,data);
      var responseData = UserResponse.fromJson(response);
      return responseData;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future getUpdateEmail(BuildContext context, dynamic data)async{
    String jwt = await StoredData().readData("jwt");
    try {
      print("api call started");
      final response = await ApiClient.post(AppConstant.updateEmailUrl,json.encode(data),token:jwt );
      return UpdateEmailResponse.fromJson(response);

    } catch (e) {
      print("exception from repository$e");
      return Future.error(e);
    }
  }
}