import 'dart:convert';

import 'package:http/http.dart';
import 'package:prayer_times_app/prayer_time_model.dart';

class PrayerTimeApiManager {
  Future<PrayerTimeModel> getPrayerTimes() async {
    print("Get prayer times started");
    //Initialize the prayerTime model as null because the data hasn't been fetched
    PrayerTimeModel prayerTimesModel;

    var prayerTimesUrl = "https://www.islamicfinder.us/index.php/api/prayer_times?country=ke&timezone=africa/nairobi&time_format=2&longitude=36.8167&latitude=--1.2833";

    var uri = Uri.parse(prayerTimesUrl);

    try {
      var response = await get(uri);
      //Check if the response was successful
      if (response.statusCode == 200) {
        print("Response okay: ${response.statusCode}");
        var jsonData = response.body;
        var jsonMap = jsonDecode(jsonData);

        //Convert the json data to the model
        prayerTimesModel = PrayerTimeModel.fromJson(jsonMap);
        print("Network call is a success: ${prayerTimesModel.success}");
      }
    } catch (e) {
      print("response error, $e");
      return prayerTimesModel;
    }
    return prayerTimesModel;
  }
}
