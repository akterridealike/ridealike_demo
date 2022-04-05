import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ridealike_demo/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:ridealike_demo/helpers/local_data_store.dart';
import 'dart:convert';

import '../../helpers/input_validator.dart';

class AuthController extends ChangeNotifier {
  bool isLoading = false;
  String resMessage = '';
  String? error;

  void errorText() {
    var _error = Validator.isMatch;
    if (_error) {
      error = null;
    } else {
      error = "Invalid email format";
      notifyListeners();


    }


  }

  void loginUser({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    notifyListeners();

    String url = AppConstant.loginUrl;

    final body = {"Email": email, "Password": password};
    print(body);

    try {
      http.Response req =
          await http.post(Uri.parse(url), body: json.encode(body));

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        isLoading = false;
        resMessage = "Login successfull!";
        notifyListeners();

        final userId = res['User']['UserID'];
        final profileId = res['User']['ProfileID'];
        final token = res['JWT'];
        StoredData().writeData("userId", userId);
        StoredData().writeData("profileId", profileId);
        StoredData().writeData("jwt", token);
      } else {
        final res = json.decode(req.body);

        resMessage = res['message'];

        print(res);
        isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      isLoading = false;
      resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      isLoading = false;
      resMessage = "Please try again`";
      notifyListeners();

      print("$e");
    }
  }

  void clear() {
    resMessage = "";
    notifyListeners();
  }
}
