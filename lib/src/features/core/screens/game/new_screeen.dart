import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:unipod/src/features/core/models/location_model.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  String locationMessage = "Current Location of the User";
  late String lat;
  late String long;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location Service are disabled");
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location Permission are permanently denied");
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            Text(
              locationMessage,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _getCurrentLocation().then((value) {
                    lat = "${value.latitude}";
                    long = "${value.longitude}";
                    setState(() {
                      locationMessage = "Latitude:  $lat, Longtitude: $long ";
                      updateDB(lat, long);
                    });
                  });
                },
                child: const Text("Get Current Locations"))
          ],
        )),
      ),
    );
  }

  void updateDB(String lat, String long) async {
    double latt = double.parse(lat);
    double longg = double.parse(long);
    await _firestore
        .collection("location")
        .doc(_auth.currentUser!.uid)
        .set(LocationModel(latitude: latt, longitude: longg).toJson());
  }
}
