import 'dart:convert';

import 'package:clima_weather_app/services/location.dart';
import 'package:clima_weather_app/services/networking.dart';
import 'package:http/http.dart';

const apiKey = 'db5b17b49b953f97c81e13016110512c';
const openWeatherMapAPI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<Map<String, dynamic>> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    // NetworkHelper networkHelper = NetworkHelper(
    //     '$openWeatherMapAPI?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    // var weatherData = await networkHelper.getData();
    // return weatherData;

    Response response = await get(Uri.parse(
        '$openWeatherMapAPI?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'));
    var data = jsonDecode(response.body);
    print(data);
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
