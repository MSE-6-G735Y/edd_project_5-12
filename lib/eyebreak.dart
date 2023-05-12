import 'dart:async';

import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reusablecard.dart';

TextEditingController eyeBreakDuration = TextEditingController();
bool eyeBreakActive = false;
int frequency = 0;

//
class EyeBreak extends ConsumerStatefulWidget {
  const EyeBreak({Key? key}) : super(key: key);

  @override
  ConsumerState<EyeBreak> createState() => EyeBreakState();
}

class EyeBreakState extends ConsumerState<EyeBreak> {
  void eyeBreakTimer() async {
    //Still needs work, if no value is inputted into the textField
    //it is not zero and the while statement will still activate
    if (frequency != 0) {
      while (eyeBreakActive) {
        await Future.delayed(Duration(minutes: frequency));
        print('20s Eye Break Started');
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.requestPermission();
        //
        const AndroidNotificationDetails androidNotificationDetails =
            AndroidNotificationDetails('your channel id', 'your channel name',
                channelDescription: 'your channel description',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker');
        const NotificationDetails notificationDetails =
            NotificationDetails(android: androidNotificationDetails);
        await flutterLocalNotificationsPlugin.show(
            0, 'Your 20s Eye Break', 'plain body', notificationDetails,
            payload: 'item x');
        await Future.delayed(Duration(seconds: 20));
        print('20s Eye Break Ended');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
        toggleSwitch: Switch(
            activeColor: ref.watch(personalizationProvider).accentColor,
            inactiveTrackColor: ref.watch(personalizationProvider).accent2Color,
            value: eyeBreakActive,
            onChanged: (value) {
              setState(() {
                eyeBreakActive = value;
              });
              print('$eyeBreakActive');
              eyeBreakTimer();
            }),
        settingTitle: 'Eye Break',
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 40,
                  child: Text('Time between notifications',
                      style: ref.watch(personalizationProvider).textFont(
                          textStyle: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor))),
                )),
                SizedBox(
                    width: 80,
                    height: 20,
                    child: TextField(
                      onSubmitted: (value) async {
                        print('$value');
                        int frequencyValue = int.parse(value);
                        frequency = frequencyValue;
                        //eyeBreakTimer();
                        // while (eyeBreakActive) {
                        //   await Future.delayed(Duration(seconds: frequencyValue));
                        //   print('Eye break started');
                        //   await Future.delayed(Duration(seconds: 20));
                        //   print('Eye break ended');
                        // }
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0123456789]'))
                      ],
                      controller: eyeBreakDuration,
                      style: TextStyle(
                          color: ref.watch(personalizationProvider).textColor),
                      cursorColor: ref.watch(personalizationProvider).textColor,
                      decoration: InputDecoration(
                          hintText: 'minutes',
                          hintStyle: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .accent2Color)),
                    ))
              ],
            ),
            // Switch(
            //     value: eyeBreakActive,
            //     onChanged: (value) {
            //       setState(() {
            //         eyeBreakActive = value;
            //       });
            //       print('$eyeBreakActive');
            //       eyeBreakTimer();
            //     }),
            // Expanded(
            //     child: SizedBox(
            //   height: 40,
            //   child: Text('Time between notifications',
            //       style: TextStyle(
            //           color: ref.watch(personalizationProvider).textColor)),
            // )),
            // SizedBox(
            //     width: 80,
            //     height: 20,
            //     child: TextField(
            //       onSubmitted: (value) async {
            //         print(value);
            //         int frequency = int.parse(value);
            //         while (eyeBreakActive) {
            //           await Future.delayed(Duration(seconds: frequency));
            //           print('Eye break started');
            //           await Future.delayed(const Duration(seconds: 20));
            //           print('Eye break ended');
            //         }
            //       },
            //       inputFormatters: [
            //         FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
            //       ],
            //       controller: eyeBreakDuration,
            //       style: TextStyle(
            //           color: ref.watch(personalizationProvider).textColor),
            //       cursorColor: ref.watch(personalizationProvider).textColor,
            //       decoration: InputDecoration(
            //           hintText: 'minutes',
            //           hintStyle: TextStyle(
            //               color:
            //                   ref.watch(personalizationProvider).accent2Color)),
            //     ))
          ],
        ));
  }
}
