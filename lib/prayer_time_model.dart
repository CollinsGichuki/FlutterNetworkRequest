// To parse this JSON data, do
//
//     final prayerTimeModel = prayerTimeModelFromJson(jsonString);

import 'dart:convert';

PrayerTimeModel prayerTimeModelFromJson(String str) => PrayerTimeModel.fromJson(json.decode(str));

String prayerTimeModelToJson(PrayerTimeModel data) => json.encode(data.toJson());

class PrayerTimeModel {
  PrayerTimeModel({
    this.results,
    this.settings,
    this.success,
  });

  Results results;
  Settings settings;
  bool success;

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) => PrayerTimeModel(
    results: Results.fromJson(json["results"]),
    settings: Settings.fromJson(json["settings"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "results": results.toJson(),
    "settings": settings.toJson(),
    "success": success,
  };
}

class Results {
  Results({
    this.fajr,
    this.duha,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  String fajr;
  String duha;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    fajr: json["Fajr"],
    duha: json["Duha"],
    dhuhr: json["Dhuhr"],
    asr: json["Asr"],
    maghrib: json["Maghrib"],
    isha: json["Isha"],
  );

  Map<String, dynamic> toJson() => {
    "Fajr": fajr,
    "Duha": duha,
    "Dhuhr": dhuhr,
    "Asr": asr,
    "Maghrib": maghrib,
    "Isha": isha,
  };
}

class Settings {
  Settings({
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.juristic,
    this.highLatitude,
    this.fajirRule,
    this.maghribRule,
    this.ishaRule,
    this.timeFormat,
  });

  String name;
  Location location;
  String latitude;
  String longitude;
  String timezone;
  int method;
  int juristic;
  int highLatitude;
  Rule fajirRule;
  Rule maghribRule;
  Rule ishaRule;
  String timeFormat;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    name: json["name"],
    location: Location.fromJson(json["location"]),
    latitude: json["latitude"],
    longitude: json["longitude"],
    timezone: json["timezone"],
    method: json["method"],
    juristic: json["juristic"],
    highLatitude: json["high_latitude"],
    fajirRule: Rule.fromJson(json["fajir_rule"]),
    maghribRule: Rule.fromJson(json["maghrib_rule"]),
    ishaRule: Rule.fromJson(json["isha_rule"]),
    timeFormat: json["time_format"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "location": location.toJson(),
    "latitude": latitude,
    "longitude": longitude,
    "timezone": timezone,
    "method": method,
    "juristic": juristic,
    "high_latitude": highLatitude,
    "fajir_rule": fajirRule.toJson(),
    "maghrib_rule": maghribRule.toJson(),
    "isha_rule": ishaRule.toJson(),
    "time_format": timeFormat,
  };
}

class Rule {
  Rule({
    this.type,
    this.value,
  });

  int type;
  int value;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": value,
  };
}

class Location {
  Location({
    this.city,
    this.state,
    this.country,
  });

  String city;
  String state;
  String country;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "city": city,
    "state": state,
    "country": country,
  };
}
