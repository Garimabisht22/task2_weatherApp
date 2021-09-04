import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/weather_model.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Map weatherData =  await WeatherModel().getLocationWeather();
    Map currentWeatherData = await WeatherModel().getCurrentWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      print(currentWeatherData['main']['temp']);
      return HomeScreen(weatherData['list'],currentWeatherData);
    }
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Weather Application",style: TextStyle(
                color: Colors.indigo,
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
              ),
              spin
            ],
          ),
        ),
      ),
    );
  }
}
Widget spin = SpinKitChasingDots(
  color: Colors.indigo,
  size: 60,
);
