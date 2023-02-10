import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'main.dart';
import 'personalization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NightLight extends ConsumerStatefulWidget {
  const NightLight({Key? key}) : super(key: key);

  @override
  ConsumerState<NightLight> createState() => NightLightState();
}

class NightLightState extends ConsumerState<NightLight> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
          settingTitle: 'Night Light',
          content: Row(
            children: [
              Expanded(
                child: Container(
                    child: Text('Schedule',
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor))),
              ),
              Container(
                //color: Colors.indigo,
                width: 50,
                height: 20,
                child: ToggleSwitch(),
              ),
              Container(
                height: 20,
                child: Row(children: [
                  Container(
                      width: 15,
                      height: 10,
                      child: TextField(
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
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
                    child: TextField(
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
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Text('to',
                      style: TextStyle(
                          color:
                              ref.watch(personalizationProvider).textColor))),
              Container(
                height: 20,
                child: Row(children: [
                  Container(
                      width: 15,
                      height: 10,
                      child: TextField(
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
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
                    child: TextField(
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
          )),
    );
  }
}
