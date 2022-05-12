import 'package:flutter/material.dart';
import 'package:ridealike_demo/screens/swap_screen/swap_interface.dart';
class SwapCar extends StatefulWidget {
  const SwapCar({Key? key}) : super(key: key);

  @override
  State<SwapCar> createState() => _SwapCarState();
}

class _SwapCarState extends State<SwapCar> implements SwapInterface {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void onLoadedSwapCars() {
    // TODO: implement onLoadedSwapCars
  }
}
