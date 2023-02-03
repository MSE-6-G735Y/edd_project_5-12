
import 'package:flutter/material.dart';
import 'reusablecard.dart';
import 'main.dart';

class NightLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReusableCard(
          settingTitle: 'Night Light',
          content: Row(
            children: [
              Expanded(
                child: Container(child: Text('Schedule')),
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
                  Container(width: 15, height: 10, child: TextField()),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: Text(':')),
                  Container(
                    child: TextField(),
                    width: 25,
                    height: 10,
                  )
                ]),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Text('to')),
              Container(
                height: 20,
                child: Row(children: [
                  Container(width: 15, height: 10, child: TextField()),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 1),
                      child: Text(':')),
                  Container(
                    child: TextField(),
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
