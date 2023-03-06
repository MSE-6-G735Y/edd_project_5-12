// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';

import 'package:eddproject/main.dart';
// import 'dart:ffi';

import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reusablecard.dart';

List<Widget> specificBreaks = [];

TextEditingController textControllerF = TextEditingController();
TextEditingController textControllerD = TextEditingController();

class Break extends ConsumerStatefulWidget {
  const Break({Key? key}) : super(key: key);

  @override
  ConsumerState<Break> createState() => BreakState();
}

class BreakState extends ConsumerState<Break> {
  int duration = 0;
  bool isBreakOn = false;
  int frequency = 0;

  void timer() async {
    while (isBreakOn) {
      await Future.delayed(Duration(seconds: frequency));
      print('break started');
      //

      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');
      var platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(0, 'Your break has started',
          'Your break has started', platformChannelSpecifics,
          payload: 'item x');
      await Future.delayed(Duration(seconds: duration));
      print('break over');
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              AlertDialog(title: Text('Your Break has Ended')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
        settingTitle: 'Break',
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 30,
                        //color: Colors.red,
                        child: Text(
                          'Frequency',
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                        ))),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  height: 30,
                  //color: Colors.green,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    ],
                    onSubmitted: (value) async {
                      print('Frequency: $value');
                      print('$isBreakOn');
                      int frequencyValue = int.parse(value);
                      frequency = frequencyValue;
                      timer();
                      // BreakTimer(
                      //     frequencyValue: frequency,
                      //     durationValue: duration,
                      //     isBreakOn: isBreakOn);
                      // while (isBreakOn) {
                      //   await Future.delayed(Duration(seconds: frequency));
                      //   print('break started');
                      //   //
                      //   FlutterLocalNotificationsPlugin
                      //       flutterLocalNotificationsPlugin =
                      //       FlutterLocalNotificationsPlugin();
                      //   flutterLocalNotificationsPlugin
                      //       .resolvePlatformSpecificImplementation<
                      //           AndroidFlutterLocalNotificationsPlugin>()
                      //       ?.requestPermission();
                      //   //
                      //   const AndroidNotificationDetails
                      //       androidNotificationDetails =
                      //       AndroidNotificationDetails(
                      //           'your channel id', 'your channel name',
                      //           channelDescription: 'your channel description',
                      //           importance: Importance.max,
                      //           priority: Priority.high,
                      //           ticker: 'ticker');
                      //   const NotificationDetails notificationDetails =
                      //       NotificationDetails(
                      //           android: androidNotificationDetails);
                      //   await flutterLocalNotificationsPlugin.show(
                      //       0,
                      //       'Your $duration Minute has Break Started',
                      //       'plain body',
                      //       notificationDetails,
                      //       payload: 'item x');
                      //   //
                      //   await Future.delayed(Duration(seconds: duration));
                      //   print('break over');
                      //   showDialog(
                      //       context: context,
                      //       builder: (BuildContext context) => AlertDialog(
                      //           title: Text('Your Break has Ended')));
                      // }
                      //
                      //
                      //
                      // while (true) {
                      //   Future.delayed(Duration(seconds: frequency), () {
                      //     print('break started');
                      //   });
                      //   Future.delayed(Duration(seconds: duration), () {
                      //     print('break over');
                      //   });
                      // }
                      // Timer.periodic((Duration(seconds: frequency)), (timer) {
                      //   print('$frequency');
                      //   print('break started');

                      //   // Future.delayed(Duration(seconds: duration), () {
                      //   //   print('');
                      //   // });
                      //   Timer((Duration(seconds: duration)), () {
                      //     print('break over');
                      //   });
                      // });
                    },

                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    // ],
                    // onChanged: (String) {
                    //   Timer(Duration(seconds: 2), () {
                    //     print('2');
                    //   });
                    // },
                    controller: textControllerF,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                    decoration: InputDecoration(
                        hintText: 'minutes',
                        hintStyle: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    //color: Colors.green,
                    child: Text('Duration',
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  height: 30,
                  //color: Colors.green,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    ],
                    onSubmitted: (value) {
                      int durationValue = int.parse(value);
                      duration = durationValue;
                      print('Duration: $duration');
                    },
                    // onChanged: (text) {
                    //   valueD = text;
                    //   print('Duration: $valueD');
                    // },
                    controller: textControllerD,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                    decoration: InputDecoration(
                        hintText: 'minutes',
                        hintStyle: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color)),
                  ),
                )
              ],
            ),
            Container(
              child: Switch(
                  value: isBreakOn,
                  onChanged: (value) {
                    setState(() {
                      isBreakOn = value;
                    });
                    print('$isBreakOn');
                    timer();
                  }),
              // child: ElevatedButton(
              //     child: Text('Stop Break'),
              //     onPressed: () {
              //       print('$isBreakActive');
              //       if (isBreakActive = false) {
              //         isBreakActive = true;
              //       } else {
              //         isBreakActive = false;
              //       }
              //     }),
            ),
            //Container(child: ),
            Column(children: specificBreaks),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text('Add Specific Break',
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor)),
                  ),
                ),
                Container(
                    // height: 20,
                    // width: 20,
                    child: IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    setState(() {
                      //Adding specific breaks to a list, need way to remove specific breaks and make them function
                      specificBreaks.add(Container(
                        //color: Colors.blue,
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    child: Text('Break 1'),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 20,
                                  child: Row(children: [
                                    SizedBox(
                                        width: 17,
                                        height: 10,
                                        child: TextField()),
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 1),
                                        child: Text(':')),
                                    SizedBox(
                                      child: TextField(),
                                      width: 25,
                                      height: 10,
                                    )
                                  ]),
                                  //color: Colors.pink,
                                )
                              ],
                            ),
                            Row(children: [
                              Expanded(
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    child: Text('Duration 1')),
                              ),
                              SizedBox(
                                  //alignment: Alignment.centerLeft,
                                  width: 80,
                                  height: 30,
                                  child: TextField(
                                    style: TextStyle(
                                        color: ref
                                            .watch(personalizationProvider)
                                            .textColor),
                                    cursorColor: ref
                                        .watch(personalizationProvider)
                                        .textColor,
                                    decoration: InputDecoration(
                                        hintText: 'minutes',
                                        hintStyle: TextStyle(
                                            color: ref
                                                .watch(personalizationProvider)
                                                .accent2Color)),
                                  ))
                            ]),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      )
                          //   Container(
                          //   height: 10,
                          //   width: 10,
                          //   color: Colors.blue,
                          //   child: Text('1'),
                          // )
                          );
                    });

                    print(specificBreaks);
                  },
                  icon: Icon(Icons.add,
                      color: ref.watch(personalizationProvider).accent2Color),
                ))
                // Container(
                //   height: 30,
                //   width: 50,
                //   alignment: Alignment.center,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(primary: Colors.green),
                //     onPressed: () {

                //     },
                //     child: Icon(Icons.add,
                //         color: ref.watch(personalizationProvider).accent2Color),
                //   ),
                // ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     BreakTimer();
            //     //Timer(Duration(seconds: 2), () {
            //     //print('2');
            //     //});
            //   },
            //   child: Text('Test'),
            // )
          ],
        ),
      ),
    );
  }
}

// class BreakTimer {
//   int frequencyValue;
//   int durationValue;

//   BreakTimer({this.frequencyValue = 0, this.durationValue = 0});
//   void main() {
//     Timer(Duration(seconds: frequencyValue), () {
//       print('$frequencyValue');
//     });
//   }
// }

// class BreakTimer {
//   int frequencyValue;
//   int durationValue;
//   bool isBreakOn;

//   BreakTimer(
//       {this.frequencyValue = 0,
//       this.durationValue = 0,
//       this.isBreakOn = false});
//   void main() async {
//     print(isBreakOn);
//     while (isBreakOn) {
//       await Future.delayed(Duration(seconds: frequencyValue));
//       print('break started');
//       await Future.delayed(Duration(seconds: durationValue));
//       print('break over');
//     }
//   }
// }
