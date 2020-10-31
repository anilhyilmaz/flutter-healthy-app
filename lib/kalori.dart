import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalori_takip extends StatefulWidget {
  @override
  _Kalori_takipState createState() => _Kalori_takipState();
}

class _Kalori_takipState extends State<Kalori_takip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        onPressed:()=>print("ggg"),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), //
    );
  }
}