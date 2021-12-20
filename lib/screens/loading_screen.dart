import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/city_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }
  void getLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var wedta = await weatherModel.getLocationData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: wedta); // PUSHING THE 'location_screen.dart'
    }));

    // double temp = deDt['main']['temp'];
    // int condition = deDt['weather'][0]['id'];
    // String name = deDt['name'];
    //
    // print(temp);
    // print(condition);
    // print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color:Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
