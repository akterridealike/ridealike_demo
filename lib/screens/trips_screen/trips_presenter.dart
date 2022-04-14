import 'package:ridealike_demo/data_model/upcoming_trips_response.dart';

import '../../helpers/local_data_store.dart';

class TripsPresenter{
  Stream<UpcomingTripsResponse> getTripData()async*{
    String userId= await StoredData().readData("userId");

  }
}