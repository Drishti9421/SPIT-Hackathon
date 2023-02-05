// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_local_variable, prefer_typing_uninitialized_variables, unused_import, prefer_collection_literals

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=19.126188,72.834575&radius=50000&keyword=recycle&key=AIzaSyD9VI4OdMbtz9zNyDdGWL-Q9dM_qv_hW_4

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers =
      new Set(); //markers for google map; //markers for google map
  static const LatLng showLocation = LatLng(19.126188, 72.834575);

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        //add first marker
        markerId: MarkerId("1"),
        position: showLocation, //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Regreen Recycling Pvt Ltd',
          snippet:
              '2nd Floor Unit No.205 Ganeshwadi CHS LTD, BLDG No.5, near Akruti Star, M.I.D.C, Andheri East, Mumbai',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add second marker
        markerId: MarkerId("2"),
        position: LatLng(19.1180364, 72.87068719999999), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Regreen Recycling Pvt Ltd',
          snippet:
              '2nd Floor Unit No.205 Ganeshwadi CHS LTD, BLDG No.5, near Akruti Star, M.I.D.C, Andheri East, Mumbai',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add third marker
        markerId: MarkerId("3"),
        position: LatLng(19.0715657, 72.8691727), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title:
              'Ecotech Recycling- E waste recycling Mumbai, E-Waste Recycling, E Waste Management in Pune India',
          snippet:
              '301, 3rd Floor, Bldg. No. 11, Commercial Tower, near Trade Center, Bandra Kurla Complex, Bandra East, Mumbai',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        //add third marker
        markerId: MarkerId("4"),
        position: LatLng(19.112175, 73.0224186), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'GOGREENRECYCLING',
          snippet: 'A-8, Electronic Sadan, Mahape Midc Rd, Mahape, Navi Mumbai',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        //add third marker
        markerId: MarkerId("5"),
        position: LatLng(19.165308, 72.94274399999999), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Recycle Impact',
          snippet:
              '206, Raja Industrial Estate, P.K. Road, Mulund West, Mumbai',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        //add third marker
        markerId: MarkerId("6"),
        position: LatLng(19.131447, 72.862443), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Spas Recycling Pvt Ltd',
          snippet:
              'Unit No.7,Hema Industrial Estate,Sarvodaya Nagar,, MHB Colony Rd, Meghwadi, Indira Nagar, Jogeshwari East, Mumbai',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Markers in Google Map"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: GoogleMap(
        //Map widget from google_maps_flutter package
        zoomGesturesEnabled: true, //enable Zoom in, out on map
        initialCameraPosition: CameraPosition(
          //innital position in map
          target: showLocation, //initial position
          zoom: 15.0, //initial zoom level
        ),
        markers: getmarkers(), //markers to show on map
        mapType: MapType.normal, //map type
        onMapCreated: (controller) {
          //method called when map is created
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}
