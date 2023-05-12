import 'package:flutter/material.dart';
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
  ReusableCard(
      {super.key,
      required this.settingTitle,
      required this.content,
      required this.toggleSwitch});
  //String settingTitle;
  //
  String settingTitle;
  Widget content;
  Widget toggleSwitch;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: content,
                )
              ],
              title: Text(
                settingTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ))),
            Container(
                alignment: Alignment.topRight, width: 50.0, child: toggleSwitch
                //const ToggleSwitch(),
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
