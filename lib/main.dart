import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  // final LatLng _center = const LatLng(46.8125, -92.1930);
  final LatLng _center = const LatLng(46.8188, -92.0843);
  

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();

    _addMarkers();
  }

  void _addMarkers() {
         // Define the coordinates for your markers
         final LatLng location1 = LatLng(46.8195, -92.0840); // Example: UMD
         final LatLng location2 = LatLng(46.8125, -92.1930); // Example: Texas road house
         final LatLng location3 = LatLng(46.8221, -92.0745); // Example: CRISP & GREEN 

         // Create the markers
         _markers.add(
           Marker(
             markerId: MarkerId('marker1'),
             position: location1,
             infoWindow: InfoWindow(
               title: 'UMD',
               snippet: 'University of Minnesota Duluth',
             ),
           ),
         );

         _markers.add(
           Marker(
             markerId: MarkerId('marker2'),
             position: location2,
             infoWindow: InfoWindow(
               title: 'Texas Road House',
               snippet: 'Texas Road House bar and grill',
             ),
           ),
         );

         _markers.add(
           Marker(
             markerId: MarkerId('marker3'),
             position: location3,
             infoWindow: InfoWindow(
               title: 'CRISP & GREEN',
               snippet: ' CRISP & GREEN restaurant',
             ),
           ),
         );
       }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: _markers,
        ),
      ),
    );
  }
}