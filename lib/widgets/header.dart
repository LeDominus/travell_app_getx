// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weather_app_getx/controllers/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "Загрузка...";

  GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.checkLatitude.value,
        globalController.checkLongitude.value);
    super.initState();
  }

  void getAddress(lat, lon) async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
      if (placemark.isNotEmpty) {
        Placemark place = placemark[0];
        setState(() {
          city = place.locality ?? "Локальное название недоступно";
        });
      } else {
        setState(() {
          city = "Местоположение на найдено";
        });
      }
    } catch (e) {
      setState(() {
        city = "Ошибка при определении местоположения";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Text(city,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black
            ),),
        )
      ],
    );
  }
}
