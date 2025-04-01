import 'dart:async';

import 'package:parking_system_map/Controller/AuthController.dart';
import 'package:parking_system_map/Pages/AboutUs/AboutUs..dart';
import 'package:parking_system_map/Pages/Home/HomePage.dart';
import 'package:parking_system_map/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Controller/ParkingController.dart';

class GoogleMapPage extends StatelessWidget {
  const GoogleMapPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> controller = Completer();
    const LatLng center = LatLng(19.234124275328096, 72.9904723082163);
    ParkingController parkingController = Get.put(ParkingController());
    AuthController authController = Get.put(AuthController());
    Set<Marker> markers = {
      Marker(
        onTap: () {
          Get.to(HomePage());
        },
        visible: true,
        markerId: MarkerId('parking_1'),
        position: LatLng(19.23397259059652, 72.99061818831264),
      ),
      Marker(
        onTap: () {
          Get.to(HomePage());
        },
        visible: true,
        markerId: MarkerId('parking_2'),
        position: LatLng(19.234092810060442, 72.99188779284806),
      ),
      Marker(
        onTap: () {
          Get.to(HomePage());
        },
        visible: true,
        markerId: MarkerId('parking_3'),
        position: LatLng(19.232460684688114, 72.99110687670826),
      ),
      Marker(
        onTap: () {
          Get.to(HomePage());
        },
        visible: true,
        markerId: MarkerId('parking_4'),
        position: LatLng(19.236080934989168, 72.989329574354),
      ),
      Marker(
        onTap: () {},
        visible: true,
        markerId: MarkerId('parking_5'),
        position: LatLng(19.23547614578978, 72.99089937442352),
      ),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Stations'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(ProfilePage());
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              Get.to(AboutUs());
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: GoogleMap(
        buildingsEnabled: true,
        compassEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: center,
          zoom: 14.0,
        ),
        markers: markers,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
