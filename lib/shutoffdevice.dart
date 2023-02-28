import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'reusablecard.dart';
import 'personalization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'providers.dart';

TextEditingController sundayHr = TextEditingController();
TextEditingController sundayMin = TextEditingController();
TextEditingController mondayHr = TextEditingController();
TextEditingController mondayMin = TextEditingController();
TextEditingController tuesdayHr = TextEditingController();
TextEditingController tuesdayMin = TextEditingController();
TextEditingController wednesdayHr = TextEditingController();
TextEditingController wednesdayMin = TextEditingController();
TextEditingController thurdayHr = TextEditingController();
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

class ShutOffDeviceState extends ConsumerState<ShutOffDevice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
          settingTitle: 'Shut Off Device',
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Sunday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: sundayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              ),
              //
              //
              //
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Monday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: mondayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              ),
              //
              //
              //
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Tuesday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: tuesdayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              ),
              //
              //
              //
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Wednesday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: wednesdayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              ),
              //
              //
              //
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Thursday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: thurdayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              ),
              //
              //
              //
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Friday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: fridayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              ),
              //
              //
              //
              Row(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text('Saturday'))),
                  Container(
                    child: ToggleSwitch(),
                    width: 60,
                    //color: Colors.amber,
                  ),
                  Container(
                    width: 50,
                    height: 20,
                    child: Row(children: [
                      Container(
                          width: 17,
                          height: 10,
                          //
                          //
                          //
                          child: TextField(
                            controller: saturdayHr,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0123456789]'))
                            ],
                            style: TextStyle(
                                color: ref
                                    .watch(personalizationProvider)
                                    .textColor),
                            cursorColor:
                                ref.watch(personalizationProvider).textColor,
                          )),
                      //
                      //
                      //
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Text(':')),
                      Container(
                        //
                        //
                        //
                        child: TextField(
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
                  )
                ],
              )
            ],
          )),
    );
  }
}

class ShutOffDeviceTile extends StatelessWidget {
  ShutOffDeviceTile({required this.day});

  String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child:
                Container(alignment: Alignment.centerLeft, child: Text(day))),
        Container(
          child: ToggleSwitch(),
          width: 60,
          //color: Colors.amber,
        ),
        Container(
          width: 50,
          height: 20,
          child: Row(children: [
            Container(width: 17, height: 10, child: TextField()),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 1), child: Text(':')),
            Container(
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
