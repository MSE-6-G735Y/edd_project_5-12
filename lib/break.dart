import 'dart:async';
// import 'dart:ffi';

import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'reusablecard.dart';
import 'personalization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

TextEditingController textControllerF = TextEditingController();
TextEditingController textControllerD = TextEditingController();

class Break extends ConsumerStatefulWidget {
  const Break({Key? key}) : super(key: key);

  @override
  ConsumerState<Break> createState() => BreakState();
}

class BreakState extends ConsumerState<Break> {
  int duration = 0;
  bool isBreakActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
        settingTitle: 'Break',
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        height: 30,
                        //color: Colors.red,
                        child: Text(
                          'Frequency',
                          style: TextStyle(
                              color:
                                  ref.watch(personalizationProvider).textColor),
                        ))),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  height: 30,
                  //color: Colors.green,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    ],
                    onSubmitted: (value) {
                      print('Frequency: $value');
                      int frequency = int.parse(value);
                      Timer.periodic((Duration(seconds: frequency)), (timer) {
                        print('$frequency');
                        print('break started');

                        Timer((Duration(seconds: duration)), () {
                          print('break over');
                        });
                      });
                    },

                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    // ],
                    // onChanged: (String) {
                    //   Timer(Duration(seconds: 2), () {
                    //     print('2');
                    //   });
                    // },
                    controller: textControllerF,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                    decoration: InputDecoration(
                        hintText: 'minutes',
                        hintStyle: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    //color: Colors.green,
                    child: Text('Duration',
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  height: 30,
                  //color: Colors.green,
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    ],
                    onSubmitted: (value) {
                      int durationValue = int.parse(value);
                      duration = durationValue;
                      print('$duration');
                    },
                    // onChanged: (text) {
                    //   valueD = text;
                    //   print('Duration: $valueD');
                    // },
                    controller: textControllerD,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                    decoration: InputDecoration(
                        hintText: 'minutes',
                        hintStyle: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    child: Text('Add Specific Break',
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor)),
                  ),
                ),
                // Container(
                //   height: 30,
                //   width: 50,
                //   alignment: Alignment.center,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(primary: Colors.green),
                //     onPressed: () {

                //     },
                //     child: Icon(Icons.add,
                //         color: ref.watch(personalizationProvider).accent2Color),
                //   ),
                // ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     BreakTimer();
            //     //Timer(Duration(seconds: 2), () {
            //     //print('2');
            //     //});
            //   },
            //   child: Text('Test'),
            // )
          ],
        ),
      ),
    );
  }
}

// class BreakTimer {
//   int frequencyValue;
//   int durationValue;

//   BreakTimer({this.frequencyValue = 0, this.durationValue = 0});
//   void main() {
//     Timer(Duration(seconds: frequencyValue), () {
//       print('$frequencyValue');
//     });
//   }
// }
