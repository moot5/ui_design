import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

import 'package:flutter/cupertino.dart';

import 'package:geolocator/geolocator.dart';

import 'package:fluttertoast/fluttertoast.dart';


class MapHere extends StatelessWidget {
  static const String route = '/mapHere';
  HereMapController mapController;


  @override
  Widget build(BuildContext context) {
    SdkContext.init(IsolateOrigin.main);
    return Scaffold(
      appBar: AppBar(title: Text('MapHere')),
      //drawer: buildDrawer(context,route),
      body: HereMap(onMapCreated: _onMapCreated),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    mapController = hereMapController;
    mapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
            (MapError error) {
          if (error != null) {
            print('Map scene not loaded. MapError: ${error.toString()}');
            return;
          }

          const double distanceToEarthInMeters = 150; //remove hard coded value, should be set by user via gestures
          mapController.camera.lookAtPointWithDistance(
              GeoCoordinates(52.7050557, -1.7826655), distanceToEarthInMeters);
        });

    b_LocationProvider locProv = new b_LocationProvider();
    locProv.start();
  }

  void updateMap(GeoCoordinates coordinates){
    mapController.camera.lookAtPointWithDistance(coordinates, 150);
  }
}

class b_LocationListener implements LocationListener {

  @override
  onLocationTimeout() {
    // TODO: implement onLocationTimeout
    // check signal strength, if none pop up alert, if good wait for new location update
  }

  @override
  onLocationUpdated(Location location) {
    print("location has updated");
    //double accuracy = (location.horizontalAccuracyInMeters != null) ? location
     //   .horizontalAccuracyInMeters : 0.0;
    GeoCoordinates coordinates = location.coordinates;
    print(coordinates.latitude);
    print(coordinates.longitude);
    double lat = coordinates.latitude;
    String toast = ("Coordinates are: $lat" );
    Fluttertoast.showToast(msg: toast);
    //MapHere().updateMap(coordinates);

    //mapController.camera.lookAtPointWithDistance(coordinates, 5.0);

  }

  @override
  void release() {
    // TODO: implement release
  }

}

class b_LocationProvider implements LocationProvider {
  StreamSubscription<Position> positionStream;

  @override
  LocationListener listener;

  @override
  void release() {
    // TODO: implement release
  }

  start() {
    listener = new b_LocationListener();
    bool started = true;
    print(started);
    streamUpdates();
  }

  @override
  stop() {
    // TODO: implement stop
    positionStream.cancel();
    //sort actual stop method
  }

  void streamUpdates(){
    var geolocator = Geolocator();
    List<double> alist = new List();
    List<double> alist2 = new List();
    List<Position> alist3 = new List();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);
    positionStream = geolocator.getPositionStream(locationOptions).listen(
            (Position position) {
              print(position.timestamp);
              alist.add(position.latitude);
              alist2.add(position.longitude);
              alist3.add(position);
              GeoCoordinates coordinates = new GeoCoordinates(position.latitude,position.longitude);
              Location location = new Location.withDefaults(coordinates, DateTime.now());
              listener.onLocationUpdated(location);
              print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
            });
  }
}








