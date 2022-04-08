import 'package:flutter/cupertino.dart';

import '../app_constants.dart';
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
    try {
      final response = await ApiClient.post(AppConstant.updateEmailUrl,data);
      var responseData = UserResponse.fromJson(response);
      return responseData;
    } catch (e) {
      return Future.error(e);
    }
  }
}