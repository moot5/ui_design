import 'package:flutter/material.dart';
//import 'package:here_sdk/core.dart';
//import 'package:here_sdk/mapview.dart';
import 'package:flutter/cupertino.dart';

/*
class MapHere extends StatelessWidget {
  static const String route = 'mapHere';

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MapHere')),
      //drawer: buildDrawer(context,route),
      body: HereMap(onMapCreated: _onMapCreated),
    );
  }
   */

  @override
  Widget build(BuildContext context) {
    SdkContext.init(IsolateOrigin.main);
    return MaterialApp(
      title: 'HERE SDK for Flutter - Hello Map!',
      home: HereMap(onMapCreated: _onMapCreated),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError error) {
      if (error != null) {
        print('Map scene not loaded. MapError: ${error.toString()}');
        return;
      }

      const double distanceToEarthInMeters = 80;
      hereMapController.camera.lookAtPointWithDistance(
          GeoCoordinates(52.530932, 13.384915), distanceToEarthInMeters);


    });
  }
}

 */
