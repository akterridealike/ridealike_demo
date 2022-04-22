import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ridealike_demo/data_model/car_details_response.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_interface.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_presenter.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> implements TripsInterFace {
  late List _carName;
  late List _carImage;
  TripsPresenter? _presenter;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _presenter = TripsPresenter(this);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: FutureBuilder<UpcomingTripsResponse>(
          future: _presenter?.getTripData(context),
          builder: (context, tripSnapshot) {
            if (tripSnapshot.hasError) {
              print("error from futurebuilder${tripSnapshot.error}");
              return Text("Something Error");
            } else if (tripSnapshot.hasData) {
              var tripData = tripSnapshot.data?.trips as List;
              print("trips $tripData");
              // var carData = _carResponse?.cars as List;
              //Todo should make a method
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  //have to declare count
                  itemCount: tripData.length,
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
                                child: Image.network(
                                 // "",
                                  "https://api.storage.ridealike.com/${_carImage[index]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                               Text("${_carName[index]}"),
                              Text("${tripData[index].startDateTime}"),
                              Text("${tripData[index].endDateTime}")
                            ],
                          ),
                        ),
                      ));
            } else {
              return  const Center(child: CircularProgressIndicator());


            }
          }),
    );
  }

  @override
  void onLoadedCarData(List<String?> carName,List<String?> carImage) {
   setState(() {
     _carName = carName ;
     _carImage= carImage ;
   });
  }

  // void onLoadedTripData(data) {
  //
  // }
}
