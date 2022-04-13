import 'package:flutter/material.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);
  static String routeName = '/booking-details';

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      StreamBuilder<UpcomingTripsResponse>(
        stream: null,
        builder: (context, snapshot) {

        }
      ),
    );
  }
}
