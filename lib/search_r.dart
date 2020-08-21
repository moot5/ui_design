import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class search_r extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    _search_r createState() => _search_r();
    throw UnimplementedError();
  }

}

class _search_r extends State<search_r>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}