// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: StopWatch(),
    );
  }
}

class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Timer? t1;
  Duration duration = Duration(seconds: 0);
  bool isRuning = false;

  startTimer() {
    t1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newSecond = duration.inSeconds;
        newSecond++;/// incrementing the seconds
        duration = Duration(seconds: newSecond);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    //  margin: EdgeInsets.only(bottom: 22),/////sdsdad
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      duration.inHours.toString().padLeft(2, "0"),
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                  Text(
                    "Hours ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      duration.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                  Text(
                    "Minutes ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      duration.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, "0"),
                      style: TextStyle(fontSize: 80),
                    ),
                  ),
                  Text(
                    "Seconds ",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          if (!isRuning)
            ElevatedButton(
              onPressed: () {
                isRuning = true;

                !startTimer();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              child: Text(
                "Start Timer ",
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
          if (isRuning)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () 
                  {  
                    setState(() {
                        t1!.cancel();
                                        isRuning =false ;
                    });


                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 198, 46, 35)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "Stop Timer",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                                      

                    setState(() {  t1!.cancel();
                        duration = Duration(hours: 0);
                                        isRuning =false ;
                    });
                    

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 198, 46, 35)),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "Cancel Timer",
                    style: TextStyle(fontSize: 19, color: Colors.white),
                  ),
                ),
              ],
            ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
