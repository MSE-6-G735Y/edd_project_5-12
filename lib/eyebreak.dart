import 'dart:async';

import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'reusablecard.dart';

TextEditingController eyeBreakDuration = TextEditingController();
bool eyeBreakActive = true;

//
class EyeBreak extends ConsumerStatefulWidget {
  const EyeBreak({Key? key}) : super(key: key);

  @override
  ConsumerState<EyeBreak> createState() => EyeBreakState();
}

class EyeBreakState extends ConsumerState<EyeBreak> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
          settingTitle: 'Eye Break',
          content: Row(
            children: [
              Expanded(
                  child: SizedBox(
                height: 40,
                child: Text('Time between notifications',
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor)),
              )),
              SizedBox(
                  width: 80,
                  height: 20,
                  child: TextField(
                    onSubmitted: (value) async {
                      print(value);
                      int frequency = int.parse(value);
                      while (eyeBreakActive) {
                        await Future.delayed(Duration(seconds: frequency));
                        print('Eye break started');
                        await Future.delayed(const Duration(seconds: 20));
                        print('Eye break ended');
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0123456789]'))
                    ],
                    controller: eyeBreakDuration,
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor),
                    cursorColor: ref.watch(personalizationProvider).textColor,
                    decoration: InputDecoration(
                        hintText: 'minutes',
                        hintStyle: TextStyle(
                            color: ref
                                .watch(personalizationProvider)
                                .accent2Color)),
                  ))
            ],
          )),
    );
  }
}
