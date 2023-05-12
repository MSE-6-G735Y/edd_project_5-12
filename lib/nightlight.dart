import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'main.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/services.dart';

List<String> time1List = <String>[
  'pm',
  'am',
];

List<String> time2List = <String>[
  'pm',
  'am',
];

TextEditingController startHr = TextEditingController();
TextEditingController startMin = TextEditingController();
TextEditingController endHr = TextEditingController();
TextEditingController endMin = TextEditingController();

//int hour1in24 = 0;
int hour1 = 0;
int min1 = 0;
int hour2 = 0;
int min2 = 0;
//
int hour1t24 = 0;
int hour2t24 = 0;
//
int initialHour = 0;
int initialMin = 0;
int initialSec = 0;
int durationMin1 = 0;
int durationHour1 = 0;
int durationMin2 = 0;
int durationHour2 = 0;

class NightLight extends ConsumerStatefulWidget {
  const NightLight({Key? key}) : super(key: key);

  @override
  ConsumerState<NightLight> createState() => NightLightState();
}

class NightLightState extends ConsumerState<NightLight> {
  //calculating wait time from instant timer is started to first inputted time
  //pretty sure this works perfectly
  void calcInitialTime() {
    now = DateTime.now();
    // if (dropdown1Value == 'am' && hour1 == 12) {
    //   hour1in24 = 0;
    // } else if (dropdown1Value == 'am' && hour1 != 12) {
    //   hour1in24 = hour1;
    // } else if (dropdown1Value == 'pm' && hour1 == 12) {
    //   hour1in24 = 12;
    // } else if (dropdown1Value == 'pm' && hour1 != 12) {
    //   hour1in24 = hour1 + 12;
    // }
    print('hour1in24: $hour1t24');
    if (now.hour <= hour1t24) {
      initialHour = hour1t24 - now.hour;
      print('initialHour -1-');
    } else if (now.hour >= hour1t24) {
      initialHour = hour1t24 + 24 - now.hour;
      print('initialHour -2-');
    }
    if (now.minute < min1) {
      initialMin = min1 - now.minute;
    } else if (now.minute >= min1) {
      initialMin = min1 + 60 - now.minute;
      initialHour = initialHour - 1;
    }
    initialSec = 60 - now.second;
    initialMin = initialMin - 1;
    //print('hour1in24: $hour1in24');
    //Initial wait times wait until the next day until they allow the timer to start.
    //Im not sure how to get it to start instantly
    print('initialHour: $initialHour');
    print('initialMin: $initialMin');
    print('initialSec: $initialSec');
  }

  void calcDuration() {
    print('calcDuration1');
    print(
        'Time 1: $hour1:$min1 $dropdown1Value Time 2: $hour2:$min2 $dropdown2Value');
    //Dropdown 1 Values - Converting to 24 Hour Time
    if (dropdown1Value == 'pm' && hour1 == 12) {
      hour1t24 = 12;
      print('-1-Hour1  $hour1t24');
    } else if (dropdown1Value == 'pm' && hour1 != 12) {
      hour1t24 = hour1 + 12;
      print('-2-Hour1  $hour1t24');
    } else if (dropdown1Value == 'am' && hour1 == 12) {
      hour1t24 = 0;
      print('-3-Hour1  $hour1t24');
    } else if (dropdown1Value == 'am' && hour1 != 12) {
      hour1t24 = hour1;
      print('-4-Hour1  $hour1t24');
    }
    // Dropdown 2 Values - Converting to 24 Hour Time
    if (dropdown2Value == 'pm' && hour2 == 12) {
      hour2t24 = 12;
      print('-1-Hour2  $hour2t24');
    } else if (dropdown2Value == 'pm' && hour2 != 12) {
      hour2t24 = hour2 + 12;
      print('-2-Hour2  $hour2t24');
    } else if (dropdown2Value == 'am' && hour2 == 12) {
      hour2t24 = 0;
      print('-3-Hour2  $hour2t24');
    } else if (dropdown2Value == 'am' && hour2 != 12) {
      hour2t24 = hour2;
      print('-4-Hour2  $hour2t24');
    }
    //Calculate DurationHour1
    if (dropdown1Value == 'pm' && dropdown2Value == 'am') {
      durationHour1 = 24 - hour1t24 + hour2t24;
    } else if (dropdown1Value == 'pm' && dropdown2Value == 'pm') {
      durationHour1 = hour2t24 - hour1t24;
    } else if (dropdown1Value == 'am' && dropdown2Value == 'am') {
      durationHour1 = hour2t24 - hour1t24;
    } else if (dropdown1Value == 'am' && dropdown2Value == 'pm') {
      durationHour1 = hour2t24 - hour1t24;
    }
    // Calculate Hours - old version, extremely conplicated and doesn't work
    // if (dropdown1Value == 'pm' && dropdown2Value == 'am') {
    //   durationHour1 = (24 - (hour1 + 12) + hour2);
    // } else if (dropdown1Value == 'pm' && dropdown2Value == 'pm') {
    //   if (hour2 <= hour1) {
    //     durationHour1 = 12 + (12 - hour1) + hour2;
    //   } else if (hour2 > hour1) {
    //     durationHour1 = hour2 - hour1;
    //   }
    // } else if (dropdown1Value == 'am' && dropdown2Value == 'pm') {
    //   durationHour1 = (hour2 + 12) - hour1;
    // } else if (dropdown1Value == 'am' && dropdown2Value == 'am') {
    //   if (hour2 <= hour1) {
    //     durationHour1 = 12 + (12 - hour1) + hour2;
    //   } else if (hour2 > hour1) {
    //     durationHour1 = hour2 - hour1;
    //   }
    // }
    // Calculate Minutes
    if (min2 >= min1) {
      durationMin1 = min2 - min1;
    } else if (min2 < min1) {
      durationMin1 = (min2 + 60) - min1;
      durationHour1 = durationHour1 - 1;
    }
    print('durationHour1: $durationHour1');
    print('durationMin1: $durationMin1');
    print('Wait time: $durationHour1:$durationMin1');
    //Calculate Duration 2
    durationHour2 = 24 - durationHour1;
    if (durationMin1 > 0) {
      durationMin2 = 60 - durationMin1;
      durationHour2 = durationHour2 - 1;
    } else {
      durationMin2 = 0;
    }

    print('durationHour2: $durationHour2');
    print('durationMin2: $durationMin2');
    print('2nd wait time: $durationHour2:$durationMin2');
  }

  //When nightlight switch on side is true, nightlight turns on.
  void nightlight() {
    if (isNightLightOn == true) {
      print('turn on nightlight');
    } else if (isNightLightOn == false) {
      print('turn off nightlight');
    }
  }

  //Timer that organizes when nightlight is on or off.
  void timer() async {
    print('timer start');
    print('isScheduleOn $isScheduleOn');
    await Future.delayed(
        Duration(hours: initialHour, minutes: initialMin, seconds: initialSec));
    print('Night Light On');
    while (isScheduleOn) {
      await Future.delayed(
          Duration(hours: durationHour1, minutes: durationMin1));
      print('Night Light Off');
      await Future.delayed(
          Duration(hours: durationHour2, minutes: durationMin2));
      print('Night Lignt On');
    }
  }

  var now = DateTime.now();
  String dropdown1Value = time1List.first;
  String dropdown2Value = time2List.first;
  bool isScheduleOn = false;
  bool isNightLightOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
          toggleSwitch: Switch(
            activeColor: ref.watch(personalizationProvider).accentColor,
            inactiveTrackColor: ref.watch(personalizationProvider).accent2Color,
            value: isNightLightOn,
            onChanged: (value) {
              setState(() {
                isNightLightOn = value;
              });
              nightlight();
              print('$isNightLightOn');
            },
          ),
          settingTitle: 'Night Light',
          content: Column(
            children: [
              Row(children: [
                Expanded(
                    child: Container(
                  child: Text('Schedule',
                      style: ref.watch(personalizationProvider).textFont(
                          textStyle: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor))),
                )),
                Container(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: isScheduleOn,
                    onChanged: (value) {
                      setState(() {
                        isScheduleOn = value;
                      });
                      print('$isScheduleOn');
                      calcDuration();
                      calcInitialTime();
                      timer();
                    },
                  ),
                  width: 50,
                  height: 20,
                )
              ]),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  Container(
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 25,
                          height: 10,
                          //
                          // Hour 1
                          //
                          child: TextField(
                            onSubmitted: (value) {
                              int hour = int.parse(value);
                              hour1 = hour;
                              print('$value');
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            controller: startHr,
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':',
                              style: TextStyle(
                                  color: ref
                                      .watch(personalizationProvider)
                                      .accent2Color))),
                      Container(
                        //
                        // Min 1
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int min = int.parse(value);
                            min1 = min;
                            print('$value');
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          controller: startMin,
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        ),
                        width: 25,
                        height: 10,
                      )
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 3),
                    child: DropdownButton<String>(
                      dropdownColor:
                          ref.watch(personalizationProvider).backgroundColor,
                      style: TextStyle(
                          color: ref.watch(personalizationProvider).textColor),
                      value: dropdown1Value,
                      onChanged: (String? value) {
                        setState(() {
                          dropdown1Value = value!;
                        });
                        print('$dropdown1Value');
                      },
                      items: time1List
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Text('to',
                          style: ref.watch(personalizationProvider).textFont(
                              textStyle: TextStyle(
                                  color: ref
                                      .watch(personalizationProvider)
                                      .textColor)))),
                  Container(
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 25,
                          height: 10,
                          //
                          // Hour 2
                          //
                          child: TextField(
                            onSubmitted: (value) {
                              int hour = int.parse(value);
                              hour2 = hour;
                              print('$value');
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            controller: endHr,
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':',
                              style: TextStyle(
                                  color: ref
                                      .watch(personalizationProvider)
                                      .accent2Color))),
                      Container(
                        //
                        // Min 2
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int min = int.parse(value);
                            min2 = min;
                            print('$value');
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          controller: endMin,
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        ),
                        width: 25,
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 3),
                        child: DropdownButton<String>(
                          dropdownColor: ref
                              .watch(personalizationProvider)
                              .backgroundColor,
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          value: dropdown2Value,
                          onChanged: (String? value) {
                            setState(() {
                              dropdown2Value = value!;
                            });
                          },
                          items: time2List
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: ref
                                    .watch(personalizationProvider)
                                    .textFont(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            color: ref
                                                .watch(personalizationProvider)
                                                .textColor)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
              // Container(
              //   padding: EdgeInsets.all(20),
              //   child: ElevatedButton(
              //     child: Text('test'),
              //     onPressed: () {
              //       final now = DateTime.now();
              //       print(now.year);
              //       print(now.month);
              //       print(now.day);
              //       print(now.hour);
              //       print(now.minute);
              //       print(now.weekday);
              //     },
              //   ),
              // )
            ],
          )),
    );
  }
}
