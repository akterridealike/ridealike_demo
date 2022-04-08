import 'package:ridealike_demo/repositories/api_repositories.dart';
import 'package:ridealike_demo/screens/email_editing_screen/email_edit_interface.dart';

class EmailEditPresenter {
  EmailEditInterface? _interface;
  ApiRepository? _apiRepository;
  String? message;

  EmailEditPresenter(EmailEditInterface interface) {
    _interface = interface;
    _apiRepository = ApiRepository();
  }


 void updateEmail(){

 }


}
