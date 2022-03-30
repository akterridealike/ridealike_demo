import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/helpers/input_validator.dart';

class LoginProvider extends ChangeNotifier{
  String? error;
  errorText(){
    var _error= Validator.errorData;
    if (_error){
      error =null;

    }else{
      error = "Invalid email format";
    }

  }


}