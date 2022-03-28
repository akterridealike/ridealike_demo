import 'package:ridealike_demo/data_model/login_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  Future<LoginResponse?> getLoginResponse(String email, String password) async {
    //   var postBody = jsonEncode({
    //     "Email": email,
    //     "Password": password,
    //   });
    //
    //   Uri url = Uri.parse("http://apiuserstg.ridealike.com/v1/user.UserService/Login");
    //   final response = await http.post(url,
    //       headers: {
    //         "Content-Type": "application/json",
    //       },
    //       body: postBody);
    //   print(response.body);
    //   return loginResponseFromJson(response.body);
    // }
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://api.user.stg.ridealike.com/v1/user.UserService/Login'));
    request.body =
        '''{\r\n    "Email":"$email",\r\n    "Password":"$password"\r\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

      print(response.stream);
      return loginResponseFromJson(response.toString());
  }
}
