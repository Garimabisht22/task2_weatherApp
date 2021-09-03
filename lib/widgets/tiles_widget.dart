import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_model.dart';

class TilesWidget extends StatefulWidget {
  final Map data;
  final String time;
  TilesWidget({required this.data, required this.time});

  @override
  _TilesWidgetState createState() => _TilesWidgetState();
}

class _TilesWidgetState extends State<TilesWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        width: width / 3.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.data['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.data['weather'][0]['main'],
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.data['main']['temp'].toInt().toString() + "°C",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(WeatherModel()
                    .getWeatherIcon(widget.data['main']['temp'].toInt())),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.time,
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
