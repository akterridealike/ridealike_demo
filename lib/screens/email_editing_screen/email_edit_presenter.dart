import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/repositories/api_repositories.dart';
import 'package:ridealike_demo/screens/email_editing_screen/email_edit_interface.dart';

import '../../helpers/local_data_store.dart';

class EmailEditPresenter {
  EmailEditInterface? _interface;
  ApiRepository? _apiRepository;
  String? message;

  EmailEditPresenter(EmailEditInterface interface) {
    _interface = interface;
    _apiRepository = ApiRepository();
  }

  void updateEmail(BuildContext context, String newEmail) async {
    String userId = await StoredData().readData("userId");
    String email = await StoredData().readData("email");
    try {
      var response = await _apiRepository?.getUpdateEmail(context,
          jsonEncode({"Email": email, "NewEmail": newEmail, "UserId": userId}));
      print(response["Status"]['success']);
      print(jsonEncode({"Email": email, "NewEmail": newEmail, "UserId": userId}));
      _interface?.onSuccess(response['Status']['success']);
    } catch (e) {
      _interface?.onError("$e");
    }
  }
}
