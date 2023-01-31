import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'reusablecard.dart';

class ShutOffDeviceTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
          settingTitle: 'Shut Off Device',
          content: Column(
            children: [
              ShutOffDevice(day: 'Sunday'),
              ShutOffDevice(day: 'Monday'),
              ShutOffDevice(day: 'Tuesday'),
              ShutOffDevice(day: 'Wednesday'),
              ShutOffDevice(day: 'Thursday'),
              ShutOffDevice(day: 'Friday'),
              ShutOffDevice(day: 'Saturday'),
            ],
          )),
    );
  }
}

class ShutOffDevice extends StatelessWidget {
  ShutOffDevice({required this.day});

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
