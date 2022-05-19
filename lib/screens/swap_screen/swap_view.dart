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
  List? _carList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter = SwapPresenter(this);
    _presenter?.getSwapRecommendedCarsData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _carList==null?const Center(child: CircularProgressIndicator()):
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Image.network(
                // "",
                "https://api.storage.stg.ridealike.com/${_carList![0].imageIDs[0]}",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("${_carList![0].title}"),
            Text("${_carList![0].fuelType}"),
            Text("${_carList![0].location}")
          ],
        ),
      )
    );

  }

  @override
  void onLoadedSwapCars(List? swapCarList) {
    setState(() {
      _carList = swapCarList;
    });
  }
}
