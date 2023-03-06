import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class About extends ConsumerStatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  ConsumerState<About> createState() => AboutState();
}

class AboutState extends ConsumerState<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                  'This app\'s features intend to help the user avoid the effects of extended and uniterrupted use of devices. Options for breaks, device shut of times and night lights can help combat digital eye strain by encouraging breaks during device use and limiting the effects of blue light. ',
                  style: TextStyle(
                      color: ref.watch(personalizationProvider).textColor)),
            )
          ],
          title: const Text(
            'About',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
