import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_widgets_decor/custom_button.dart';
import '../../../custom_widgets_decor/custom_textfield.dart';

class EmailEdit extends StatelessWidget {
  String? email;

  EmailEdit({Key? key, this.email}) : super(key: key);
  TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailEditingController.text = email.toString();

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: const Text("Edit your Email"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CustomTextField(
                label: "Email",
                hintText: "demo@email",
                controller:emailEditingController,
              ),
              CustomButton(btnTxt: 'Change Email',onTap: (){
                print(emailEditingController.text);
                print("emailEditingController.text");

              },)
            ],
          ),
        ),
      ),
    );
  }
}
