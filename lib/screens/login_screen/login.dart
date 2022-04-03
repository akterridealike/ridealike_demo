import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:ridealike_demo/controllers/providers/login_provider.dart';
import 'package:ridealike_demo/helpers/input_validator.dart';
import 'package:ridealike_demo/helpers/local_data_store.dart';
import 'package:ridealike_demo/my_themes.dart';
import 'package:ridealike_demo/screens/booking_details_screen/booking_details.dart';
import 'package:toast/toast.dart';

import '../../controllers/repositories/auth_repo.dart';
import '../../custom_widgets_decor/custom_button.dart';
import '../../custom_widgets_decor/custom_textfield.dart';
import '../../custom_widgets_decor/custom_toast.dart';

//TODO proper formatting
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
   bool isPressed = false;
  String? _email= "";
  String? _pass="";

 //TODO fix login check logic and flow
 Future onPressedLoginBtn() async {
    // _email = _emailController.text.toString();
    // _pass = _passwordController.text.toString();
    print(_email);
    print(_pass);


    await Provider.of<LoginProvider>(context,listen: false).getLoginData(_email, _pass);


    if (_email=='') {
      ToastComponent.showDialog("Enter Email", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else if (_pass=='') {
      ToastComponent.showDialog("Enter Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else if ( Provider.of<LoginProvider>(context,listen: false).email != _email) {
      ToastComponent.showDialog(
          "Authentication Error! Please check User name And Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else {
      ToastComponent.showDialog("Congratulation !", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      Navigator.of(context).pushNamed('/booking-details', arguments: {
        "userId": "${Provider.of<LoginProvider>(context,listen: false).userId}",
        "jwt":"${Provider.of<LoginProvider>(context,listen: false).jwt}"
      });

        Provider.of<LoginProvider>(context,listen: false).userId;
      print ("from login to check userId from provider ${Provider.of<LoginProvider>(context,listen: false).userId}");


    }
     StoredData().writeData( "user_id", "${Provider.of<LoginProvider>(context,listen: false).userId}");
     StoredData().writeData( "profile_id", "${Provider.of<LoginProvider>(context,listen: false).profileId}");
     StoredData().writeData( "user_id",  "${Provider.of<LoginProvider>(context,listen: false).jwt}");
     StoredData().readData("user_id");
     print("${StoredData.data}");




  }


  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        elevation: 0.0,
        title: Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    'images/logo_login.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: const Text(
                "Go Farther",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                CustomTextField(
                  hintText: "Please Enter Email",
                  fillColor: AppColors.whiteColor,
                  inputType: TextInputType.emailAddress,
                  // controller: _emailController,
                  label: "Email",
                  onChanged: (val) {
                    Validator.emailChecker(val);
                    setState(() {
                      _email = val;
                    });
                    loginProvider.errorText();
                    print(Validator.emailChecker(val));
                    print(val);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Please provide Password",
                  fillColor: AppColors.whiteColor,
                  inputType: TextInputType.visiblePassword,
                  // controller: _passwordController,
                  onChanged: (val) {
                    setState(() {
                      _pass = val;
                    });
                  },
                  isShowSuffixIcon: true,
                  isPassword: true,
                  label: "Password",
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: AppColors.mediumGrey),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ),

                loginProvider.error == null
                    ? Container()
                    : Text(
                        loginProvider.error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                SizedBox(
                  height: 30,
                ),
                _email == "" || _pass == ""
                    ? Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomButton(
                          btnTxt: "Login",
                          onTap: null,
                        ))
                    : Container(
                        margin: const EdgeInsets.only(left: 16, right: 16),
                        child: CustomButton(
                          btnTxt: "Login",
                          onPressed: isPressed,
                          onTap: () {
                            onPressedLoginBtn();
                            setState(() {
                              isPressed= true;
                            });
                          },
                        )),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
