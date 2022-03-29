import 'package:ridealike_demo/data_model/login_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  static Future<LoginResponse?> getLoginResponse(email, password) async {
    var postBody = jsonEncode({
      "Email": "$email",
      "Password": '$password',
    });

    Uri url =
        Uri.parse("https://apiuserstg.ridealike.com/v1/user.UserService/Login");
    final response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: postBody);
    // print(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }
}
