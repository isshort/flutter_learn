import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

class TimeZoneList extends StatefulWidget {
  const TimeZoneList({Key? key}) : super(key: key);

  @override
  State<TimeZoneList> createState() => _TimeZoneListState();
}

class _TimeZoneListState extends State<TimeZoneList> {
  late List<TimeZoneLocation> _timeZoneLocation;
  @override
  void initState() {
    _timeZoneLocation = tz.timeZoneDatabase.timeItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_timeZoneLocation);
    return Scaffold(
      appBar: AppBar(title: const Text('TimeZoneList Title')),
      body: Column(
        children: const [],
      ),
    );
  }
}

extension on tz.LocationDatabase {
  List<TimeZoneLocation> timeItems() {
    return locations.entries
        .map((e) => TimeZoneLocation(e.key, e.value))
        .toList();
  }
}

class TimeZoneLocation {
  final String name;
  final tz.Location locations;

  TimeZoneLocation(this.name, this.locations);
}
