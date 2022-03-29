import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridealike_demo/screens/booking_details_screen/booking_details.dart';
import 'package:ridealike_demo/screens/login_screen/login.dart';
import 'package:ridealike_demo/screens/profile_screen/profile.dart';
import 'package:ridealike_demo/screens/swap_screen/swap.dart';

void main() {
  runApp(

    MultiProvider(
      providers :[
        FutureProvider(create: , initialData: null),
        StreamProvider(create: , initialData: null),
        ChangeNotifierProvider(create: )
      ],
      child :  const MyApp()
    )
     );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes:{
        '/':(context)=> const Login(),
        BookingDetails.routeName:(ctx)=> const BookingDetails(),
        SwapCar.routeName:(ctx)=>const SwapCar(),
        Profile.routeName:(ctx)=> const Profile()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Login(),
    );
  }
}


