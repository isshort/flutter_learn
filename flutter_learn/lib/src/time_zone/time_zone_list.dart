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
    return Scaffold(
      appBar: AppBar(title: const Text('TimeZoneList Title')),
      body: ColumnWithSpace(
        space: 3,
        children: [
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.red),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.green),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.red),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.green),
          ),
          Container(
            height: 34,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          // SizedBox(
          //   height: 500,
          //   child: ListView.builder(
          //     itemCount: 20,
          //     itemBuilder: (context, index) => const Padding(
          //       padding: EdgeInsets.all(8.0),
          //       child: ListTile(
          //         textColor: Colors.red,
          //         tileColor: Colors.grey,
          //         title: Text("Hello"),
          //       ),
          //     ),
          //   ),
          // )
        ],
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

class ColumnWithSpace extends StatelessWidget {
  const ColumnWithSpace({
    Key? key,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    required this.children,
    required this.space,
  }) : super(key: key);
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final List<Widget> children;
  final double space;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: children
          .map((child) => Padding(
                padding: EdgeInsets.only(top: space, left: 3, right: 3),
                child: child,
              ))
          .toList(),
    );
  }
}
