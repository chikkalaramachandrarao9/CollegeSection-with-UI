import 'dart:ui';

import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  //  static final routeName = "/Preferences";

  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(46.0),
            child: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
            ),
          ),
          body: Container(
              child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Preferences',
                  style: TextStyle(color: Color(0xff12ACB1), fontSize: 30.0),
                ),
              ),
            ),
          ]))),
    );
  }
}
