import 'package:flutter/material.dart';
import 'package:ridealike_demo/my_themes.dart';
import 'package:ridealike_demo/screens/booking_details_screen/booking_details.dart';
import 'package:toast/toast.dart';

import '../../controllers/repositories/auth_repo.dart';
import '../../custom_widgets_decor/custom_button.dart';
import '../../custom_widgets_decor/custom_textfield.dart';
import '../../custom_widgets_decor/custom_toast.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool isEnable=false;


  onPressedLoginBtn() async {
    var email = _emailController.text.toString();
    var password = _passwordController.text.toString();
    print(email);
    print(password);

    var loginResponse = await AuthRepository
        .getLoginResponse(email, password);

    if(email.isEmpty){
      ToastComponent.showDialog("Enter Email", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    }else if(password.isEmpty){
      ToastComponent.showDialog("Enter Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else if(loginResponse?.user?.email!=email ){
      ToastComponent.showDialog("Authentication Error! Please check User name And Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);

    }else{
      ToastComponent.showDialog("Congratulation !", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BookingDetails() ));


    }


  }




  @override
  Widget build(BuildContext context) {
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
                  controller: _emailController,
                  label: "Email",

                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  hintText: "Please provide Password",
                  fillColor: AppColors.whiteColor,
                  inputType: TextInputType.visiblePassword,
                  controller: _passwordController,

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
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child:
                  CustomButton(
                    btnTxt: "Login",
                    backgroundColor: AppColors.accentColor,
                    onTap:() => onPressedLoginBtn(),
                  )

                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
