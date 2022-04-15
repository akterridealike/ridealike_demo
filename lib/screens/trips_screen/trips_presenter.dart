import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
import 'package:ridealike_demo/repositories/api_repositories.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_interface.dart';

import '../../helpers/local_data_store.dart';

class TripsPresenter {
  ApiRepository? _apiRepository;
  TripsInterFace? _interFace;

  TripsPresenter(TripsInterFace interFace) {
    _apiRepository = ApiRepository();
    _interFace = interFace;
  }

  Stream<UpcomingTripsResponse> getTripData(BuildContext context) async* {
    String userId = await StoredData().readData("userId");
    //ToDo try catch block
    UpcomingTripsResponse upcomingTripsResponse = await _apiRepository
        ?.getTripsData(context, {
      "Limit": "200",
      "Skip": "0",
      "UserID": userId,
      "TripStatusGroup": "Upcoming"
    });

    // List<String?> carIds = [];
    // for (var i in upcomingTripsResponse.trips!) {
    //   carIds.add(i.carId);
    // }
    // var carData = await _apiRepository?.getCarData(context, {"carIDs": carIds});
    // _interFace?.onLoadedCarData(carData);

    yield upcomingTripsResponse;
  }
}
