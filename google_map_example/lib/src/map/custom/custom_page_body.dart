import 'package:flutter/material.dart';
import 'package:google_map_example/src/map/custom/data/location.dart'
    as Location;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class CustomPageBody extends StatefulWidget {
  const CustomPageBody({super.key});

  @override
  State<CustomPageBody> createState() => _CustomPageBodyState();
}

class _CustomPageBodyState extends State<CustomPageBody> {
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  late GoogleMapController googleMapController;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final _markers = <Marker>[];
    googleMapController = controller;
    final googleOffices = await Location.getGoogleOffices();
    print(googleOffices);
    setState(() {
      _markers.clear();
      for (var office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers.add(marker);
      }
    });
  }

  Future<void> _onMapTap(LatLng val) async {
    //     final address = await placemarkFromCoordinates(
    //   val.latitude,
    //   val.longitude,
    //   localeIdentifier: 'ru',
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
              target: LatLng(42.86409393745507, 74.57551281899214), zoom: 12)),
    );
  }
}
