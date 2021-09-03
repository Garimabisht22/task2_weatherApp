import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_model.dart';
import 'package:weather_app/widgets/tiles_widget.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {

  final List LocationWeather;
  final Map currentWeather;

  HomeScreen( this.LocationWeather, this.currentWeather);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String _timeString="";

  void _getTime() {
    final String formattedDateTime =
    DateFormat('MM dd yyyy \n kk:mm').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Flutter Weather App"),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
               //mainAxisAlignment: MainAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: width/5,
                  ),
                  Text(
                    widget.currentWeather['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12,color: Colors.white),
                  ),
                  Text(widget.currentWeather['weather'][0]['main'],style: TextStyle(fontSize: 30,color: Colors.white),),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(widget.currentWeather['main']['temp'].toInt().toString()+"°C",style: TextStyle(fontSize: 15,color: Colors.white),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(WeatherModel().getWeatherIcon(widget.currentWeather['main']['temp'].toInt())),
                  ),
                  Text(_timeString.toString(),style: TextStyle(fontSize: 17,color: Colors.white),textAlign: TextAlign.center,),
                  SizedBox(
                    height: width/1,
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: width/1.8,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal ,
                    itemCount: widget.LocationWeather.length-1,
                    itemBuilder: (BuildContext, index) {
                      return TilesWidget(data: widget.LocationWeather[index+1], time: _timeString.toString(),);
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
