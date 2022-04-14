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
      appBar: AppBar(
        title: const Text(""),
      ),
      body: StreamBuilder<UpcomingTripsResponse>(
          stream: null,
          builder: (context, tripSnapshot) {
            return tripSnapshot.hasError == true
                ? const Text("Something Wrong")
                : tripSnapshot.hasData == true
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        //have to declare count
                        itemCount: 1,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 200,
                                      child: Image.network("",fit: BoxFit.cover,),
                                    ),
                                     Text("car Name"),
                                     Text("start date"),
                                     Text("end date")
                                  ],
                                ),
                              ),
                            ))
                    : tripSnapshot.connectionState == ConnectionState.waiting
                        ? const Center(child: CircularProgressIndicator())
                        : const Center(
                            child: Text("can't Connect to the server"),
                          );
          }),
    );
  }
}
