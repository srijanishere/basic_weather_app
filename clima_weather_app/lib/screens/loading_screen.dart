import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima_weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    var networkData = WeatherModel().getLocationWeather();
    Duration duration = Duration(seconds: 3);
    await Future.delayed(duration, () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(networkData);
      }));
    });
  }

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitCubeGrid(
            size: 80.0,
            color: Colors.teal,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'Fetching Location',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      )),
    );
  }
}
