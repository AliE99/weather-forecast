import 'package:flutter/material.dart';
import 'package:weather_forecast/services/location.dart';
import 'package:weather_forecast/services/networking.dart';

const String apiKey = '59835ffd36ce660ad0b9c9ba79bd4014';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  void getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
