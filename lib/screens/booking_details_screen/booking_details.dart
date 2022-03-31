import 'package:flutter/material.dart';
class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);
  static String routeName = '/booking-details';

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
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
