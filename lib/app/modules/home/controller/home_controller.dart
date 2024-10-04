import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

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
    // Parse the dateTimeString into a DateTime object
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Format the time using the desired format
    String formattedTime =
        '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';

    return formattedTime;
  }

  Future<Position?> getCurrentLocation() async {
    // Check if location services are enabled
    // try{
    //    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }
    // }catch(e){
    //   print(e.toString());
    // }

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
