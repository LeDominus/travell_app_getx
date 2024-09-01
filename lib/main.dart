import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/views/home_screen.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      defaultTransition: Transition.cupertino,
      home: HomeScreen(),
      title: "TravelApp",
      debugShowCheckedModeBanner: false,
    );
  }
}

