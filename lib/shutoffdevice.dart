import 'package:flutter/material.dart';
import 'main.dart';
import 'reusablecard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'providers.dart';

List<String> ampmList = <String>[
  'pm',
  'am',
];

TextEditingController sundayHr = TextEditingController();
TextEditingController sundayMin = TextEditingController();
TextEditingController mondayHr = TextEditingController();
TextEditingController mondayMin = TextEditingController();
TextEditingController tuesdayHr = TextEditingController();
TextEditingController tuesdayMin = TextEditingController();
TextEditingController wednesdayHr = TextEditingController();
TextEditingController wednesdayMin = TextEditingController();
TextEditingController thursdayHr = TextEditingController();
TextEditingController thursdayMin = TextEditingController();
TextEditingController fridayHr = TextEditingController();
TextEditingController fridayMin = TextEditingController();
TextEditingController saturdayHr = TextEditingController();
TextEditingController saturdayMin = TextEditingController();

class ShutOffDevice extends ConsumerStatefulWidget {
  const ShutOffDevice({Key? key}) : super(key: key);

  @override
  ConsumerState<ShutOffDevice> createState() => ShutOffDeviceState();
}

//
//I know there must be a way to make this part of the app simpler and less repetitive,
//but I don't know how to do it and I have to get this app finished soon.
//
class ShutOffDeviceState extends ConsumerState<ShutOffDevice> {
  void startShutOffDevice() async {
    while (shutOffDeviceOn) {
      await Future.delayed(Duration(seconds: 1));
      now = DateTime.now();
      print(now.minute);
      if (mondayBool = true &&
          now.weekday == 1 &&
          now.hour == monHr24 &&
          now.minute == monMin) {
        print('Monday - off');
        // monOff = true;
        // sunOff = false;
      } else if (tuesdayBool = true &&
          now.weekday == 2 &&
          now.hour == tuesHr24 &&
          now.minute == tuesMin) {
        print('Tuesday - off');
        // tuesOff = true;
        // monOff = false;
      } else if (wednesdayBool = true &&
          now.weekday == 3 &&
          now.hour == wedHr24 &&
          now.minute == wedMin) {
        print('Wednesday - off');
        // wedOff = true;
        // tuesOff = false;
      } else if (thursdayBool = true &&
          now.weekday == 4 &&
          now.hour == thursHr24 &&
          now.minute == thursMin) {
        print('Thursday - off');
        // thursOff = true;
        // wedOff = false;
      } else if (fridayBool = true &&
          now.weekday == 5 &&
          now.hour == friHr24 &&
          now.minute == friMin) {
        print('Friday - off');
        // friOff = true;
        // thursOff = false;
      } else if (saturdayBool = true &&
          now.weekday == 6 &&
          now.hour == satHr24 &&
          now.minute == satMin) {
        print('Saturday - off');
        // satOff = true;
        // friOff = false;
      } else if (sundayBool = true &&
          now.weekday == 7 &&
          now.hour == sunHr24 &&
          now.minute == sunMin) {
        print('Sunday - off');
        // sunOff = true;
        // satOff = false;
      } else {
        await Future.delayed(Duration(seconds: 1));
      }
    }
    // while (shutOffDeviceOn) {
    //   if (sundayBool = true &&
    //       now.weekday == 7 &&
    //       now.hour == sunHr24 &&
    //       now.minute == sunMin) {
    //     print('Sunday - off');
    //   }
    //   if (mondayBool = true &&
    //       now.weekday == 1 &&
    //       now.hour == monHr24 &&
    //       now.minute == monMin) {
    //     print('Monday - off');
    //   }
    //   if (tuesdayBool = true &&
    //       now.weekday == 2 &&
    //       now.hour == tuesHr24 &&
    //       now.minute == tuesMin) {
    //     print('Tuesday - off');
    //   }
    //   if (wednesdayBool = true &&
    //       now.weekday == 3 &&
    //       now.hour == wedHr24 &&
    //       now.minute == wedMin) {
    //     print('Wednesday - off');
    //   }
    //   if (thursdayBool = true &&
    //       now.weekday == 4 &&
    //       now.hour == thursHr24 &&
    //       now.minute == thursMin) {
    //     print('Thursday - oof');
    //   }
    //   if (fridayBool = true &&
    //       now.weekday == 5 &&
    //       now.hour == friHr24 &&
    //       now.minute == friMin) {
    //     print('Friday - off');
    //   }
    //   if (saturdayBool = true &&
    //       now.weekday == 6 &&
    //       now.hour == satHr24 &&
    //       now.minute == satMin) {
    //     print('Saturday - off');
    //   }
    //}
  }

//Int values for times for each weekday
  int sunHr24 = 0;
  int monHr24 = 0;
  int tuesHr24 = 0;
  int wedHr24 = 0;
  int thursHr24 = 0;
  int friHr24 = 0;
  int satHr24 = 0;
  int sunMin = 0;
  int monMin = 0;
  int tuesMin = 0;
  int wedMin = 0;
  int thursMin = 0;
  int friMin = 0;
  int satMin = 0;

//For switch at bottom of feature
  bool shutOffDeviceOn = false;

//Bools for the switches
  bool sundayBool = false;
  bool mondayBool = false;
  bool tuesdayBool = false;
  bool wednesdayBool = false;
  bool thursdayBool = false;
  bool fridayBool = false;
  bool saturdayBool = false;

//Bools to turn on notification for each day
  bool sunOff = false;
  bool monOff = false;
  bool tuesOff = false;
  bool wedOff = false;
  bool thursOff = false;
  bool friOff = false;
  bool satOff = false;

//AM/PM values for the dropdownMenus
  String sunDropDown = ampmList.first;
  String monDropDown = ampmList.first;
  String tuesDropDown = ampmList.first;
  String wedDropDown = ampmList.first;
  String thursDropDown = ampmList.first;
  String friDropDown = ampmList.first;
  String satDropDown = ampmList.first;
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
        toggleSwitch: Switch(
          activeColor: ref.watch(personalizationProvider).accentColor,
          inactiveTrackColor: ref.watch(personalizationProvider).accent2Color,
          value: shutOffDeviceOn,
          onChanged: (value) {
            setState(() {
              shutOffDeviceOn = value;
            });
            startShutOffDevice();
            print('shutOffDeviceOn: $shutOffDeviceOn');
          },
        ),
        settingTitle: 'Shut Off Device',
        content: Column(
          children: [
            //
            //Sunday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sunday',
                          style: ref.watch(personalizationProvider).textFont(
                              textStyle: TextStyle(
                                  color: ref
                                      .watch(personalizationProvider)
                                      .textColor)),
                        ))),
                SizedBox(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: sundayBool,
                    onChanged: (value) {
                      setState(() {
                        sundayBool = value;
                      });
                      print('sundayBool: $sundayBool');
                    },
                  ),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (sunDropDown == 'pm' && hour == 12) {
                              sunHr24 = 12;
                              print('-1-sunHr:  $sunHr24');
                            } else if (sunDropDown == 'pm' && hour != 12) {
                              sunHr24 = hour + 12;
                              print('-2-sunHr:  $sunHr24');
                            } else if (sunDropDown == 'am' && hour == 12) {
                              sunHr24 = 0;
                              print('-3-sunHr:  $sunHr24');
                            } else if (sunDropDown == 'am' && hour != 12) {
                              sunHr24 = hour;
                              print('-4-sunHr:  $sunHr24');
                            }
                          },
                          controller: sundayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          sunMin = min;
                          print('sunMin: $sunMin');
                        },
                        controller: sundayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: sunDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        sunDropDown = value!;
                      });
                      print('sun: $sunDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Monday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Monday',
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor))))),
                SizedBox(
                  child: Switch(
                      activeColor:
                          ref.watch(personalizationProvider).accentColor,
                      inactiveTrackColor:
                          ref.watch(personalizationProvider).accent2Color,
                      value: mondayBool,
                      onChanged: (value) {
                        setState(() {
                          mondayBool = value;
                        });
                        print('mondayBool: $mondayBool');
                      }),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (monDropDown == 'pm' && hour == 12) {
                              monHr24 = 12;
                              print('-1-monHr:  $monHr24');
                            } else if (monDropDown == 'pm' && hour != 12) {
                              monHr24 = hour + 12;
                              print('-2-monHr:  $monHr24');
                            } else if (monDropDown == 'am' && hour == 12) {
                              monHr24 = 0;
                              print('-3-monHr:  $monHr24');
                            } else if (monDropDown == 'am' && hour != 12) {
                              monHr24 = hour;
                              print('-4-monHr:  $monHr24');
                            }
                          },
                          controller: mondayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          monMin = min;
                          print('monMin: $monMin');
                        },
                        controller: mondayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: monDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        monDropDown = value!;
                      });
                      print('mon: $monDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Tuesday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Tuesday',
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor))))),
                SizedBox(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: tuesdayBool,
                    onChanged: (value) {
                      setState(() {
                        tuesdayBool = value;
                      });
                      print('tuesdayBool: $tuesdayBool');
                    },
                  ),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (tuesDropDown == 'pm' && hour == 12) {
                              tuesHr24 = 12;
                              print('-1-tuesHr:  $tuesHr24');
                            } else if (tuesDropDown == 'pm' && hour != 12) {
                              tuesHr24 = hour + 12;
                              print('-2-tuesHr:  $tuesHr24');
                            } else if (tuesDropDown == 'am' && hour == 12) {
                              tuesHr24 = 0;
                              print('-3-tuesHr:  $tuesHr24');
                            } else if (tuesDropDown == 'am' && hour != 12) {
                              tuesHr24 = hour;
                              print('-4-tuesHr:  $tuesHr24');
                            }
                          },
                          controller: tuesdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          tuesMin = min;
                          print('tuesMin: $tuesMin');
                        },
                        controller: tuesdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: tuesDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        tuesDropDown = value!;
                      });
                      print('tues: $tuesDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Wednesday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Wednesday',
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor))))),
                SizedBox(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: wednesdayBool,
                    onChanged: (value) {
                      setState(() {
                        wednesdayBool = value;
                      });
                      print('wednesdayBool: $wednesdayBool');
                    },
                  ),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (wedDropDown == 'pm' && hour == 12) {
                              wedHr24 = 12;
                              print('-1-wedHr:  $wedHr24');
                            } else if (wedDropDown == 'pm' && hour != 12) {
                              wedHr24 = hour + 12;
                              print('-2-wedHr:  $wedHr24');
                            } else if (wedDropDown == 'am' && hour == 12) {
                              wedHr24 = 0;
                              print('-3-wedHr:  $wedHr24');
                            } else if (wedDropDown == 'am' && hour != 12) {
                              wedHr24 = hour;
                              print('-4-wedHr:  $wedHr24');
                            }
                          },
                          controller: wednesdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          wedMin = min;
                          print('wedMin: $wedMin');
                        },
                        controller: wednesdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: wedDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        wedDropDown = value!;
                      });
                      print('wed: $wedDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Thursday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Thursday',
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor))))),
                SizedBox(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: thursdayBool,
                    onChanged: (value) {
                      setState(() {
                        thursdayBool = value;
                      });
                      print('thursdayBool: $thursdayBool');
                    },
                  ),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (thursDropDown == 'pm' && hour == 12) {
                              thursHr24 = 12;
                              print('-1-thursHr:  $thursHr24');
                            } else if (thursDropDown == 'pm' && hour != 12) {
                              thursHr24 = hour + 12;
                              print('-2-thursHr:  $thursHr24');
                            } else if (thursDropDown == 'am' && hour == 12) {
                              thursHr24 = 0;
                              print('-3-thursHr:  $thursHr24');
                            } else if (thursDropDown == 'am' && hour != 12) {
                              thursHr24 = hour;
                              print('-4-thursHr:  $thursHr24');
                            }
                          },
                          controller: thursdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          thursMin = min;
                          print('thursMin: $thursMin');
                        },
                        controller: thursdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: thursDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        thursDropDown = value!;
                      });
                      print('thurs: $thursDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Friday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Friday',
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor))))),
                SizedBox(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: fridayBool,
                    onChanged: (value) {
                      setState(() {
                        fridayBool = value;
                      });
                      print('fridayBool: $fridayBool');
                    },
                  ),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (friDropDown == 'pm' && hour == 12) {
                              friHr24 = 12;
                              print('-1-friHr:  $friHr24');
                            } else if (friDropDown == 'pm' && hour != 12) {
                              friHr24 = hour + 12;
                              print('-2-friHr:  $friHr24');
                            } else if (friDropDown == 'am' && hour == 12) {
                              friHr24 = 0;
                              print('-3-friHr:  $friHr24');
                            } else if (friDropDown == 'am' && hour != 12) {
                              friHr24 = hour;
                              print('-4-friHr:  $friHr24');
                            }
                          },
                          controller: fridayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          friMin = min;
                          print('friMin: $friMin');
                        },
                        controller: fridayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: friDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        friDropDown = value!;
                      });
                      print('fri: $friDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Saturday
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text('Saturday',
                            style: ref.watch(personalizationProvider).textFont(
                                textStyle: TextStyle(
                                    color: ref
                                        .watch(personalizationProvider)
                                        .textColor))))),
                SizedBox(
                  child: Switch(
                    activeColor: ref.watch(personalizationProvider).accentColor,
                    inactiveTrackColor:
                        ref.watch(personalizationProvider).accent2Color,
                    value: saturdayBool,
                    onChanged: (value) {
                      setState(() {
                        saturdayBool = value;
                      });
                      print('saturdayBool: $saturdayBool');
                    },
                  ),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 57,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 25,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          onSubmitted: (value) {
                            int hour = int.parse(value);
                            if (satDropDown == 'pm' && hour == 12) {
                              satHr24 = 12;
                              print('-1-satHr:  $satHr24');
                            } else if (satDropDown == 'pm' && hour != 12) {
                              satHr24 = hour + 12;
                              print('-2-satHr:  $satHr24');
                            } else if (satDropDown == 'am' && hour == 12) {
                              satHr24 = 0;
                              print('-3-satHr:  $satHr24');
                            } else if (satDropDown == 'am' && hour != 12) {
                              satHr24 = hour;
                              print('-4-satHr:  $satHr24');
                            }
                          },
                          controller: saturdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        onSubmitted: (value) {
                          int min = int.parse(value);
                          satMin = min;
                          print('satMin: $satMin');
                        },
                        controller: saturdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                ),
                SizedBox(
                  child: DropdownButton<String>(
                    dropdownColor:
                        ref.watch(personalizationProvider).backgroundColor,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    value: satDropDown,
                    onChanged: (String? value) {
                      setState(() {
                        satDropDown = value!;
                      });
                      print('sat: $satDropDown');
                    },
                    items:
                        ampmList.map<DropdownMenuItem<String>>((String value) {
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
              ],
            ),
            //
            //Switch at bottom
            // Row(children: [
            //   Expanded(
            //     child: Text('will be switch on side'),
            //   ),
            //   SizedBox(
            //     child: Switch(
            //       value: shutOffDeviceOn,
            //       onChanged: (value) {
            //         setState(() {
            //           shutOffDeviceOn = value;
            //         });
            //         startShutOffDevice();
            //         print('shutOffDeviceOn: $shutOffDeviceOn');
            //       },
            //     ),
            //     width: 60.0,
            //   )
            // ])
          ],
        ));
  }
}

class ShutOffDeviceTile extends StatelessWidget {
  ShutOffDeviceTile({super.key, required this.day});

  String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child:
                Container(alignment: Alignment.centerLeft, child: Text(day))),
        const SizedBox(
          child: ToggleSwitch(),
          width: 60,
          //color: Colors.amber,
        ),
        SizedBox(
          width: 50,
          height: 20,
          child: Row(children: [
            const SizedBox(width: 17, height: 10, child: TextField()),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: const Text(':')),
            const SizedBox(
              child: TextField(),
              width: 25,
              height: 10,
            )
          ]),
          //color: Colors.pink,
        )
      ],
    );
  }
}
//I know theres a less lengthy way to write this code, i just don't know how
