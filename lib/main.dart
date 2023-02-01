// deleted: import 'dart:ffi';
// don't know if it is important
import 'dart:html';

import 'package:eddproject/providers.dart';
import 'package:eddproject/shutoffdevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//importing lib dart files
import 'personalization_provider.dart';
import 'providers.dart';
import 'reusablecard.dart';
import 'personalization.dart';
import 'about.dart';
import 'break.dart';
import 'nightlight.dart';
import 'eyebreak.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white, shadowColor: Colors.white),
          primarySwatch: Colors.blue,
          textTheme: TextTheme(headline1: TextStyle(color: Colors.black))),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(
            'Settings',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.00,
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 1.0,
              color: Colors.black,
              margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
            ),
            Break(),
            ShutOffDeviceTile(),
            NightLight(),
            EyeBreak(),
            Personalization(),
            About(),
            Container(
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.black),
            Container(
                height: 50,
                color: ref
                    .watch(personalizationProvider)
                    .accent2Color //.watch(personalizationProvider),
                ),
          ],
        ));
  }
}

//
//
//
//

//
//
//
//
class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<ToggleSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.blue,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
