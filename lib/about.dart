import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                  'This app\'s features intend to help the user avoid the effects of extended and uniterrupted use of devices. Options for breaks, device shut of times and night lights can help combat digital eye strain by encouraging breaks during device use and limiting the effects of blue light. '),
            )
          ],
          title: Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
