import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'reusablecard.dart';

class Break extends StatelessWidget {
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
                  child: Text('Frequency'),
                )),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  height: 30,
                  //color: Colors.green,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'minutes'),
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
                    child: Text('Duration'),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: 80,
                  height: 30,
                  //color: Colors.green,
                  child: TextField(
                    decoration: InputDecoration(labelText: 'minutes'),
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
                    child: Text('Add Specific Break'),
                  ),
                ),
                Container(
                  height: 30,
                  width: 50,
                  alignment: Alignment.center,
                  child: Icon(Icons.add, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
