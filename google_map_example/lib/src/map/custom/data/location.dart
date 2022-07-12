import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'location.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({required this.lat, required this.lng});

  final double lat;
  final double lng;

  factory LatLng.fromJson(Map<String, dynamic> data) => _$LatLngFromJson(data);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Region {
  final LatLng coords;
  final String id;
  final String name;
  final double zoom;

  Region(
      {required this.coords,
      required this.id,
      required this.name,
      required this.zoom});
  factory Region.fromJson(Map<String, dynamic> data) {
    return _$RegionFromJson(data);
  }
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class Office {
  Office({
    required this.address,
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.region,
  });
  final String address;
  final String id;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String region;
  factory Office.fromJson(Map<String, dynamic> data) => _$OfficeFromJson(data);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Location {
  Location({
    required this.offices,
    required this.regions,
  });

  final List<Office> offices;
  final List<Region> regions;
  factory Location.fromJson(Map<String, dynamic> data) {
    return _$LocationFromJson(data);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

Future<Location> getGoogleOffices() async {
  const googleLocationsURL = 'https://about.google/static/data/locations.json';

  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(googleLocationsURL));

    if (response.statusCode == 200) {
      return Location.fromJson(json.decode(response.body));
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  // Fallback for when the above HTTP request fails.
  return Location.fromJson(
    json.decode(
      await rootBundle.loadString('assets/locations.json'),
    ),
  );
}
