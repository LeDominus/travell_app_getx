// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/global_controller.dart';
import 'package:weather_app_getx/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call globalController to get weather data
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (globalController.checkLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else if (globalController.weatherDescription.isNotEmpty) {
            return ListView(
              children: [
                const HeaderWidget(),
                Text("Погода: ${globalController.weatherDescription.value}"),
              ],
            );
          } else {
            return const Center(child: Text("Ошибка при загрузке данных"));
          }
        }),
      ),
    );
  }
}
