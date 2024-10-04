import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../res/const.dart';
import '../model/current_weather_model.dart';
import '../model/forecast_weather_model.dart';

class HomeController extends GetxController {


  Rx<CurrentWeatherModel> currentWeatherModel = CurrentWeatherModel().obs;
  Rx<ForecastWeatherModel> forecastWeatherModel = ForecastWeatherModel().obs;


  Future<CurrentWeatherModel> getCurrentWeather() async {
    String fullUrl = "$apiBaseUrl${currentWeatherApiUrl}dhaka";
    try {
      final response = await http.get(Uri.parse(fullUrl));

      if (response.statusCode == 200) {
        // Successfully received the data
        currentWeatherModel.value =
            CurrentWeatherModel.fromJson(jsonDecode(response.body));
        update();
      } else {
        // If server returns an error code
      }
    } catch (e) {
      // If an error occurs during the request
    }

    return currentWeatherModel.value;
  }


  Future<ForecastWeatherModel> getForecastWeather() async {
    Position? position = await getCurrentLocation();

    String fullUrl =
        "$apiBaseUrl$forecastWeatherApiUrl${position!.latitude},${position.longitude}";
    try {
      final response = await http.get(Uri.parse(fullUrl));

      if (response.statusCode == 200) {
        // Successfully received the data
        forecastWeatherModel.value =
            ForecastWeatherModel.fromJson(jsonDecode(response.body));
        update();
      } else {
        // If server returns an error code
      }
    } catch (e) {
      // If an error occurs during the request
    }

    return forecastWeatherModel.value;
  }

  String convertToTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('h a').format(dateTime).toLowerCase(); // Example: 12am, 1pm
  }

  Future<Position?> getCurrentLocation() async {

    // Check for location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error('Location permissions are denied.');
      }
    }

    // Fetch the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
