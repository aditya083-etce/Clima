import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '55b302e62941904007fa6f9ea10f26d7';
const WeatherMap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String nm) async{
    var url = '$WeatherMap?q=$nm&appid=$apikey&units=metric';
    Network net = Network(url);

    var data = await net.getData();
    return data;
  }

  Future<dynamic> getLocationData()async{
    Location loc = Location();
    await loc.getCurrentLocation();

    Network net = Network('$WeatherMap?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey&units=metric');

    var data = await net.getData();

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
    } else if (temp > 21) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'If you need bring a 🧥';
    }
  }
}
