import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:collection';

class ui_poi extends StatelessWidget{
  static const String route = "poi";
  Map<String,List<String>> poiLocations = new HashMap<String,List<String>>(); // move to backend, shouldnt be here

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P.O.I',
      home: Scaffold(
        appBar: AppBar(
          title: Text('poi'),


    ),
    ));

  }
}