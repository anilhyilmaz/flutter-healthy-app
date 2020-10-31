import 'package:flutter/material.dart';
import 'package:healthy_app/Adim_olcer.dart';
import 'package:healthy_app/Kalp_atis.dart';
import 'package:healthy_app/kalori.dart';
import 'package:healthy_app/sleep_cycle.dart';
import 'package:pedometer/pedometer.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      int adim;
      adim = event.steps -4500;
      _steps = adim.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }
  void date(){
  DateTime now = new DateTime.now();
  print(now.day.toString() +" " + now.month.toString() 
  + " "  + now.year.toString() + " " + (now.hour+3).toString() + " " + now.minute.toString());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.indigo,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 140, top: 80, bottom: 12),
                      child: Text(
                        "Your health",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 140, top: 2, bottom: 12),
                      child: Text(
                        "Summary",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              flex: 2,
              child: Center(
                  child: Container(
                      child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                'Steps taken:',
                style: TextStyle(fontSize: 40),
              ),
                    ),
              Text(
                _steps,
                style: TextStyle(fontSize: 50),
              ),
                  ],
                ),
              )))),
          Expanded(
              flex: 3,
              child: Center(
                  child: Wrap(
                children: [
                  Gridview_kalp(context),
                  Gridview_uyku(context),
                  Gridview_yemek(context),
                  Gridview_adim_olcer(context)
                ],
              ))),
        ],
      ),
    );
  }
}

Widget Gridview_kalp(BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => kalp_atis()),
  );
    },
      child: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 10),
              child: Icon(Icons.healing),
            ),
            Text(
              "Kalp Atış",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.teal[50],borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

class Kalp_atis {
}
Widget Gridview_uyku(BuildContext context) {
  return GestureDetector(
    onTap: ()=>{
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Sleep_cycle())),
    },
      child: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 10),
              child: Icon(Icons.hotel),
            ),
            Text(
              "Uyku Düzeni",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.teal[50],borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
Widget Gridview_yemek(BuildContext context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Kalori_takip()),
  );
    },
      child: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 10),
              child: Icon(Icons.fastfood),
            ),
            Text(
              "Kalori Takip",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.teal[50],borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
Widget Gridview_adim_olcer(BuildContext context) {
  return GestureDetector(
    onTap:(){
      Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Adim_olcer()),
  );
    },
      child: Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 10),
              child: Icon(Icons.directions_run),
            ),
            Text(
              "Adım Ölçer",
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.teal[50],borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}



