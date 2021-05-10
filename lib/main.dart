import 'package:flutter/material.dart';
import 'package:prayer_times_app/prayer_time_api_manager.dart';
import 'package:prayer_times_app/prayer_time_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Prayer Times'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Future for the network request
  Future _getPrayerTimes;

  @override
  void initState() {
    //Make the network request when the app is created
    _getPrayerTimes = PrayerTimeApiManager().getPrayerTimes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: FutureBuilder<PrayerTimeModel>(
        future: _getPrayerTimes,
        builder: (context, snapshot){
          if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
            //This object contains the prayer times from the network request
            var prayerTime = snapshot.data.results;
            //Show the data
            return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Fajir",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Text(
                          prayerTime.fajr + " am",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dhuhr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Text(
                          prayerTime.dhuhr + " pm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Asr",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Text(
                          prayerTime.asr + "pm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Maghrib",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Text(
                          prayerTime.maghrib + " pm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ishaa",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        Text(
                          prayerTime.isha + " pm",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )
                      ],
                    )
                  ],
                )
            );
          } else {
            //Data is still being fetched, show progress bar
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}
