import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'reusablecard.dart';
import 'personalization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';

TextEditingController eyeBreakDuration = TextEditingController();

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
                  child: Container(
                height: 40,
                child: Text('Time between notifications',
                    style: TextStyle(
                        color: ref.watch(personalizationProvider).textColor)),
              )),
              Container(
                  width: 80,
                  height: 20,
                  child: TextField(
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
