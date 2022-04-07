import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ridealike_demo/controllers/auth_controller/auth_user.dart';
import 'package:ridealike_demo/screens/login_screen/login.dart';

import 'screens/profile_screen/profile_view.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthController())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Login(),
    );
  }
}
