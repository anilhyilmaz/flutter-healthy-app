import 'package:flutter/material.dart';


class Adim_olcer extends StatefulWidget {
  @override
  _Adim_olcerState createState() => _Adim_olcerState();
}

class _Adim_olcerState extends State<Adim_olcer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: FlatButton(onPressed:()=> date(), child: Text("ggg"))),
      ),
    );
  }
}
void date(){
  DateTime now = new DateTime.now();
  print(now.day.toString() +" " + now.month.toString() + " "  + now.year.toString() + " " + (now.hour+3).toString() + " " + now.minute.toString());
}