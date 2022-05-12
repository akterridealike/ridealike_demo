import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_interface.dart';

import '../../helpers/local_data_store.dart';
import '../../helpers/location_helper.dart';
import '../../repositories/api_repositories.dart';
import 'package:location/location.dart';

class SwapPresenter {
  ApiRepository? _apiRepository;
  SwapInterface? _interFace;

  SwapPresenter(SwapInterface interFace) {
    _apiRepository = ApiRepository();
    _interFace = interFace;
  }

  Future getSwapRecommendedCarsData(BuildContext context) async {
    LocationData _locationData = await getCurrentLocation();
    String userId = await StoredData().readData("userId");
    var swapAvailableCarsResponse =
        _apiRepository?.getSwapAvailableCarsByUserId(context, {
      "UserID": userId,
    });
    List availDataList = json.decode(swapAvailableCarsResponse.toString() )['SwapAvailabilitys'];
    if (kDebugMode) {
      print(availDataList);
    }
    return availDataList;
  }
}
