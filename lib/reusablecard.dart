import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';

// class ReusableCard extends ConsumerStatefulWidget {
//   ReusableCard({required this.settingTitle, required this.content});
//   String settingTitle;
//   Widget content;
//   @override
//   ConsumerState<ReusableCard> createState() =>
//       ReusableCardState(settingTitle: settingTitle, content: content);
// }

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.settingTitle, required this.content});
  //String settingTitle;
  //
  String settingTitle;
  Widget content;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          //color: Colors.blue,
          child: Row(children: [
            Expanded(
                child: Container(
                    child: ExpansionTile(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  //height: 90,
                  //color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: content,
                )
              ],
              title: Text(
                settingTitle,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ))),
            Container(
              alignment: Alignment.topRight,
              width: 50.0,
              child: ToggleSwitch(),
            )
          ])),
      // Container(
      //   height: 1.0,
      //   color: Colors.black,
      //   margin: EdgeInsets.symmetric(horizontal: 20),
      // )
    ]);
  }
}
