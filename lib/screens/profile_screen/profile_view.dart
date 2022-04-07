import 'package:flutter/material.dart';
import 'package:ridealike_demo/screens/profile_screen/profile_interface.dart';
import 'package:ridealike_demo/screens/profile_screen/profile_presenter.dart';
import 'package:ridealike_demo/screens/profile_screen/widgets/profile_btn.dart';

import '../email_editing_screen/email_edit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements ProfileInterface {

  bool? isLoading;
  ProfilePresenter? _presenter;
  dynamic user;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = ProfilePresenter(this);
    _presenter?.getProfileData(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                   ProfileButton(
                    titleText: "First Name",
                    txtData: user.profile.firstName.toString(),
                    isClickable: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   ProfileButton(
                    titleText: "Last Name",
                    txtData: user.profile.lastName.toString(),
                    isClickable: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileButton(
                    titleText: "Email",
                    txtData: user.profile.email.toString(),
                    isClickable: true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmailEdit(
                                    email: user.profile.email.toString(),
                                  )));
                    },
                  )
                ],
              ),
      ),
    );
  }

  @override
  onError() {
    // TODO: implement onError
  }

  @override
  onLoading(bool? loading) {
    // TODO: implement onLoading
    setState(() {
      isLoading = loading;
    });
  }

  @override
  onLoadedProfileData(response) {
    // TODO: implement onLoadedProfileData
    user= response;
    print( response);
  }
}
