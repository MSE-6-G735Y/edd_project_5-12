// deleted: import 'dart:ffi';
// don't know if it is important

import 'package:eddproject/providers.dart';
import 'package:eddproject/shutoffdevice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'about.dart';
import 'break.dart';
import 'eyebreak.dart';
import 'nightlight.dart';
//importing lib dart files
import 'personalization.dart';

////////// local notification setup ///////////////////////////////////////////////////

final navigatorKey = GlobalKey<NavigatorState>();
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  return runApp(const ProviderScope(child: MyApp()));
}

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
          textTheme:
              const TextTheme(displayLarge: TextStyle(color: Colors.black))),
      // A widget which will be started on application startup
      home: const MyHomePage(),
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
              margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            ),
            const Break(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const ShutOffDevice(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const NightLight(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const EyeBreak(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const Personalization(),
            Container(
              height: 1.0,
              color: ref.watch(personalizationProvider).accent2Color,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            const About(),
            Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: ref.watch(personalizationProvider).accent2Color),
            const SizedBox(
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
