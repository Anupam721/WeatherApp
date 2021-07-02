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
                DateTime date =
                    DateTime.fromMicrosecondsSinceEpoch(snapshot.data!.dt);

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
                            "${date.year},",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            '${date.month} ${date.day}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          )
                        ],
                      ),
                      Text(
                        '${snapshot.data?.main.temp} °C',
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
