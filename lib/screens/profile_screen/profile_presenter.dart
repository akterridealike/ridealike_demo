import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/screens/profile_screen/profile_interface.dart';

import '../../data_model/user_response.dart';
import '../../helpers/local_data_store.dart';
import '../../repositories/api_repositories.dart';

class ProfilePresenter {
  late ProfileInterface _interface;
  late ApiRepository _apiRepository;

  ProfilePresenter(ProfileInterface interface) {
    _interface = interface;
    _apiRepository = ApiRepository();
  }

  void getProfileData(BuildContext context) async {
    try {
      _interface.onLoading(true);
      String id = await StoredData().readData("profileId");
      UserResponse response =
      await _apiRepository.getUserData(context, jsonEncode({"ProfileID":id}) );
      print(response.profile?.firstName);
      _interface.onLoadedProfileData(response);

      _interface.onLoading(false);
    } catch (e) {
      print(e.toString());
      _interface.onError();
    }
  }
}