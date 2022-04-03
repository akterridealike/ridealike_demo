import 'package:flutter/material.dart';
class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);
  //TODO useless variable
  static String routeName = '/booking-details';

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    //TODO use constructor for data receive from another route
    var userData = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${userData['userId']}'),
            Text('${userData['jwt']}'),
          ],
        ),
      ),
    );
  }
}
