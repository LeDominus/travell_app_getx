// Создаю контроллер GetX
// ignore_for_file: deprecated_member_use, avoid_print
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxString _weatherDescription = ''.obs;

  Dio dio = Dio();

  RxBool get checkLoading => _isLoading;
  RxDouble get checkLatitude => _latitude;
  RxDouble get checkLongitude => _longitude;
  RxString get weatherDescription => _weatherDescription;

  @override
  void onInit() {
    super.onInit();
    if (_isLoading.isTrue) {
      getLocation().then((_) => getWeather());
    }
  }

  Future<void> getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      print("Сервис геолокации недоступен");
      _isLoading.value = false;
      return;
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      print("Для получения текущего местоположения требуется разрешение");
      _isLoading.value = false;
      return;
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("Для получения текущего местоположения требуется разрешение");
        _isLoading.value = false;
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print('Широта: ${position.latitude}, Долгота: ${position.longitude}');
      _latitude.value = position.latitude;
      _longitude.value = position.longitude;
      _isLoading.value = false;
    } catch (e) {
      print("Ошибка при получении местоположения: $e");
      _isLoading.value = false;
    }
  }

  Future<void> getWeather() async {
    const yandexapiKey = '9e8d9d7e-26f0-43b5-9275-1c7d64102cf5';
    final String url =
        'https://api.weather.yandex.ru/v2/forecast?lat=${_latitude.value}&lon=${_longitude.value}&lang=ru_RU&limit=1';

    try {
      final response = await dio.get(url,
          options: Options(headers: {
            'X-Yandex-API-Key': yandexapiKey,
          }));

      if (response.statusCode == 200) {
        var weatherData = response.data;
        _weatherDescription.value = weatherData['weather'][0]['description'];
        print("Погода: ${_weatherDescription.value}");
      } else {
        print("Ошибка при получении данных о погоде: ${response.statusCode}");
      }
    } catch (e) {
      print("Ошибка при получении погоды: $e");
    } finally {
      _isLoading.value = false;
    }
  }
}
