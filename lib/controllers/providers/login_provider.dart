import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/controllers/repositories/auth_repo.dart';
import 'package:ridealike_demo/helpers/input_validator.dart';

import '../../data_model/login_response.dart';

class LoginProvider extends ChangeNotifier{
  String? error;
  errorText(){
    var _error= Validator.errorData;
    if (_error){
      error =null;

    }else{
      error = "Invalid email format";
    }
    notifyListeners();

  }
  String? _userId;
  String? _profileId;
  String? _jwt;
  String? _email;
  LoginResponse? loginResponse;
  String? get userId=>_userId;
  String? get profileId =>_profileId;
  String? get jwt =>_jwt;
  String? get email=>_email;
  Future<LoginResponse?> getLoginData(email,password)async{
    var loginResponse = await AuthRepository().getLoginResponse(email, password);
    _userId= loginResponse?.user?.userId;
    _profileId = loginResponse?.user?.profileId;
    _jwt = loginResponse?.jwt;
    _email = loginResponse?.user?.email;
    print("from provide"+userId!);

    notifyListeners();

  }


}