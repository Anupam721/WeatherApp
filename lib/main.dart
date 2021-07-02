import 'package:flutter/material.dart';
import 'package:weather_app/library/api_request.dart';
import 'package:weather_app/models/Weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    var weeks = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/app_wallpaper.jpg'),
                fit: BoxFit.fill)),
        child: FutureBuilder<WeatherData>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                DateTime date = DateTime.fromMillisecondsSinceEpoch(
                    snapshot.data!.dt * 1000);

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(120)),
                      Text(
                        '${snapshot.data?.name}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${weeks[date.weekday - 1]}, ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            '${months[date.month - 1]} ${date.day}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${snapshot.data?.main.temp.toInt()}°C',
                        style: TextStyle(color: Colors.white, fontSize: 70),
                      )
                    ],
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      )),
    );
  }
}
