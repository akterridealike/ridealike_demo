import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ridealike_demo/custom_widgets_decor/custom_toast.dart';
import 'package:ridealike_demo/screens/email_editing_screen/email_edit_interface.dart';
import 'package:ridealike_demo/screens/email_editing_screen/email_edit_presenter.dart';

import '../../../custom_widgets_decor/custom_button.dart';
import '../../../custom_widgets_decor/custom_textfield.dart';

class EmailEdit extends StatefulWidget  {
  String? email;


  EmailEdit({Key? key, this.email}) : super(key: key);

  @override
  State<EmailEdit> createState() => _EmailEditState();

}

class _EmailEditState extends State<EmailEdit> implements EmailEditInterface {
  TextEditingController emailEditingController = TextEditingController();

  bool? isSuccess;

  EmailEditPresenter? _presenter;


  String? errorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter= EmailEditPresenter(this);
  }

  void onPressedEmailCngBtn() {
    if (emailEditingController.text.isEmpty) {
      ToastComponent.showToast("Email can't be empty", this);
    } else {
      _presenter?.updateEmail(context, emailEditingController.text.toString());
      isSuccess == true
          ? ToastComponent.showToast("Successfully Changed", context)
          : ToastComponent.showToast(errorMessage!, context);
      print("clivked onchange email");

    }
  }

  @override
  Widget build(BuildContext context) {
    emailEditingController.text = widget.email.toString();

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
                controller: emailEditingController,
              ),
              CustomButton(
                btnTxt: 'Change Email',
                onTap: (){
                  onPressedEmailCngBtn();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onError(String s) {
    // TODO: implement onError
    errorMessage = s;
  }

  @override
  void onSuccess(bool message) {
    // TODO: implement onSuccess
    isSuccess= message;
  }

}
