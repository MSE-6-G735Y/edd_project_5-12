import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'reusablecard.dart';

TextEditingController startHr = TextEditingController();
TextEditingController startMin = TextEditingController();
TextEditingController endHr = TextEditingController();
TextEditingController endMin = TextEditingController();

class NightLight extends ConsumerStatefulWidget {
  const NightLight({Key? key}) : super(key: key);

  @override
  ConsumerState<NightLight> createState() => NightLightState();
}

class NightLightState extends ConsumerState<NightLight> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
        settingTitle: 'Night Light',
        content: Row(
          children: [
            Expanded(
              child: Text('Schedule',
                  style: TextStyle(
                      color:
                          ref.watch(personalizationProvider).textColor)),
            ),
            const SizedBox(
              //color: Colors.indigo,
              width: 50,
              height: 20,
              child: ToggleSwitch(),
            ),
            SizedBox(
              height: 20,
              child: Row(children: [
                SizedBox(
                    width: 15,
                    height: 10,
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0123456789]'))
                      ],
                      controller: startHr,
                      style: TextStyle(
                          color:
                              ref.watch(personalizationProvider).textColor),
                      cursorColor:
                          ref.watch(personalizationProvider).textColor,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Text(':',
                        style: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color))),
                SizedBox(
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0123456789]'))
                    ],
                    controller: startMin,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                  ),
                  width: 25,
                  height: 10,
                )
              ]),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text('to',
                    style: TextStyle(
                        color:
                            ref.watch(personalizationProvider).textColor))),
            SizedBox(
              height: 20,
              child: Row(children: [
                SizedBox(
                    width: 15,
                    height: 10,
                    child: TextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0123456789]'))
                      ],
                      controller: endHr,
                      style: TextStyle(
                          color:
                              ref.watch(personalizationProvider).textColor),
                      cursorColor:
                          ref.watch(personalizationProvider).textColor,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Text(':',
                        style: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color))),
                SizedBox(
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0123456789]'))
                    ],
                    controller: endMin,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                  ),
                  width: 25,
                  height: 10,
                )
              ]),
            ),
          ],
        ));
  }
}
