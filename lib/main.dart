// deleted: import 'dart:ffi';
// don't know if it is important

import 'package:eddproject/providers.dart';
import 'package:eddproject/shutoffdevice.dart';
import 'package:flutter/material.dart';
//importing lib dart files
import 'personalization.dart';
import 'about.dart';
import 'break.dart';
import 'nightlight.dart';
import 'eyebreak.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
          //canvasColor: ref.watch(personalizationProvider).backgroundColor,
          //BackgroundColor
          scaffoldBackgroundColor:
              ref.watch(personalizationProvider).backgroundColor,
          appBarTheme: AppBarTheme(
              backgroundColor:
                  ref.watch(personalizationProvider).backgroundColor,
              shadowColor: ref.watch(personalizationProvider).backgroundColor),
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
              color: ref.watch(personalizationProvider).textColor,
            ),
          ),
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.00,
          ),
        ),
        body: ListView(
          children: [
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
            ),
            Break(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            ShutOffDeviceTile(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            NightLight(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            EyeBreak(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            Personalization(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            About(),
            Container(
                height: 1,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: ref.watch(personalizationProvider).accent2Color),
            SizedBox(
              height: 20,
            ),
            //Container(
            //    height: 50,
            //    color: ref
            //        .watch(personalizationProvider)
            //        .accentColor //.watch(personalizationProvider),
            //    ),
            //Container(
            //    height: 50,
            //    color: ref.watch(personalizationProvider).accent2Color),
            //Container(
            //    height: 50,
            //    color: ref.watch(personalizationProvider).backgroundColor),
            //Container(
            //    height: 50,
            //    color: ref.watch(personalizationProvider).textColor),
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
class ToggleSwitch extends ConsumerStatefulWidget {
  const ToggleSwitch({super.key});

  @override
  ConsumerState<ToggleSwitch> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends ConsumerState<ToggleSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: ref.watch(personalizationProvider).accentColor,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
