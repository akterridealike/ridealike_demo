import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';
import 'package:ridealike_demo/repositories/api_repositories.dart';
import 'package:ridealike_demo/screens/trips_screen/trips_interface.dart';

import '../../data_model/car_details_response.dart';
import '../../helpers/local_data_store.dart';

class TripsPresenter {
  ApiRepository? _apiRepository;
  TripsInterFace? _interFace;

  TripsPresenter(TripsInterFace interFace) {
    _apiRepository = ApiRepository();
    _interFace = interFace;
  }

  Future<UpcomingTripsResponse> getTripData(BuildContext context) async {
    String userId = await StoredData().readData("userId");
    //ToDo try catch block
    UpcomingTripsResponse upcomingTripsResponse = await _apiRepository
        ?.getTripsData(context, {
      "Limit": "200",
      "Skip": "0",
      "UserID": userId,
      "TripStatusGroup": "Upcoming"
    });

    List<String?> carName = [];
    List<String?> image = [];

    upcomingTripsResponse.trips?.asMap().forEach((index, trip) async {
      CarResponse carData =
          await _apiRepository?.getCarData(context, {"CarID": trip.carId});
      carName.add(carData.cars![index].name);
      image.add(carData.cars![index].imagesAndDocuments?.images?.mainImageId);
    });

    _interFace?.onLoadedCarData(carName, image);

    return upcomingTripsResponse;
  }
}
