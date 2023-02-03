import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'reusablecard.dart';

class EyeBreak extends StatelessWidget {
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
                child: Text('Time between notifications'),
              )),
              Container(
                  width: 80,
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Time(min)'),
                  ))
            ],
          )),
    );
  }
}
