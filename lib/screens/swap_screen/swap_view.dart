import 'package:flutter/material.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_interface.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_presenter.dart';
class SwapCar extends StatefulWidget {
  const SwapCar({Key? key}) : super(key: key);

  @override
  State<SwapCar> createState() => _SwapCarState();
}

class _SwapCarState extends State<SwapCar> implements SwapInterface {

  SwapPresenter? _presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter= SwapPresenter(this);
    _presenter?.getSwapRecommendedCarsData(context);
  }

  @override
  Widget build(BuildContext context) {

    return Container();
  }

  @override
  void onLoadedSwapCars(List? swapCarList) {
    // TODO: implement onLoadedSwapCars
  }

 
}
