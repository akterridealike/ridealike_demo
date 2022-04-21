import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ridealike_demo/data_model/car_details_response.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_interface.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_presenter.dart';

import '../../repositories/api_repositories.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> implements TripsInterFace {
  TripsPresenter? _presenter;
  ApiRepository? _apiRepository;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _presenter = TripsPresenter(this);
      _apiRepository = ApiRepository();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: StreamBuilder<UpcomingTripsResponse>(
          stream: _presenter?.getTripData(context),
          builder: (context, tripSnapshot) {
            if (tripSnapshot.hasError) {
              print("error from futurebuilder${tripSnapshot.error}");
              return Text("Something Error");
            } else if (tripSnapshot.hasData) {
              var tripData = tripSnapshot.data?.trips as List;
              print("trips $tripData");
              return upcomingTripsListView(tripData);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  ListView upcomingTripsListView(List<dynamic> tripData) {
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
                    FutureBuilder<CarResponse?>(
                        future: _apiRepository?.getCarData(
                            context, {"CarID": "${tripData[index].carId}"}),
                        builder: (context, carSnapshot) {
                          if (carSnapshot.hasData) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 200,
                                  child: Image.network(
                                    "https://api.storage.stg.ridealike.com/${carSnapshot.data?.car?.imagesAndDocuments?.images?.mainImageId}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text("${carSnapshot.data?.car?.name}"),
                              ],
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                    Text("${tripData[index].startDateTime}"),
                    Text("${tripData[index].endDateTime}")
                  ],
                ),
              ),
            ));
  }

  @override
  void onLoadedTripData(data) {
    // TODO: implement onLoadedTripData
  }

  @override
  void onLoadedCarData(List<CarResponse> caName, List<CarResponse> carImage) {
    setState(() {});
  }
}
