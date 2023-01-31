//import 'package:eddproject/backgroundcolor.dart';
import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reusablecard.dart';
//import 'backgroundcolor.dart';

//
//Text Color
//
List<Widget> textcolorList = <Widget>[
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: Colors.blueGrey,
  ),
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: const Color(0xff52416e),
  ),
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: const Color(0xff74a476),
  ),
];
Widget dropdownValueText = textcolorList.first;
//
//Background Color
//
List<Widget> backgroundcolorList = <Widget>[
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: Colors.white,
  ),
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: const Color(0xffd7d8dc),
  ),
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: const Color(0xff7c1919),
  ),
];
Widget dropdownValueBackground = backgroundcolorList.first;
//
//Accent Color 2
//
List<Widget> accentcolor2List = <Widget>[
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: Colors.indigo,
  ),
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: Colors.purple,
  ),
  Container(
    margin: const EdgeInsets.only(left: 5),
    height: 15.0,
    width: 70.0,
    color: const Color(0x73635e5e),
  ),
];
Widget dropdownValueAccent2 = accentcolor2List.first;
//
//Accent Color
//
List<Color> accentcolorList = <Color>[
  Colors.green,
  Colors.orange,
  Colors.red,
];

Color dropdownValueAccent1 = accentcolorList.first;

int accentnumber = 0;
int accent2number = 0;
//int backgroundnumber = 0;
int textnumber = 0;

Color accentcolor = Colors.green;
Color accent2color = Colors.indigo;
//Color backgroundcolor = Colors.white;
Color textcolor = Colors.blueGrey;
//MaterialColor accentcolor1 = Colors.orange;
//MaterialColor accentcolor2 = Colors.red;

class Personalization extends ConsumerStatefulWidget {
  const Personalization({Key? key}) : super(key: key);

  @override
  ConsumerState<Personalization> createState() => PersonalizationState();
}

class PersonalizationState extends ConsumerState<Personalization> {
  @override
  Widget build(BuildContext context) {
    //changes the variable accentcolor based on what the value of accent number
    //is which is in turn based on the index of the list value that is selected
    //by the dropdownmenu
    //the number accentnumber equals and color accentcolor equals needs to match
    //the index number of the color in the list accentcolorList need to
    //correspond to each other
    //
    //needs to be repeated for every dropdownmenu that will be used in the
    //personalization tab
    //
    //Accent Color
    //
    if (accentnumber == 0) {
      accentcolor = Colors.green;
    }
    if (accentnumber == 1) {
      accentcolor = Colors.orange;
    }
    if (accentnumber == 2) {
      accentcolor = Colors.red;
    }
    //
    //Accent Color 2
    //
    if (accent2number == 0) {
      accent2color = Colors.indigo;
    }
    if (accent2number == 1) {
      accent2color = Colors.purple;
    }
    if (accent2number == 2) {
      accent2color = const Color(0x73635e5e);
    }
    //
    //Background Color
    //
//    if (backgroundnumber == 0) {
//      backgroundcolor = Colors.white;
//    }
//    if (backgroundnumber == 1) {
//      backgroundcolor = Color(0xffd7d8dc);
//    }
//   if (backgroundnumber == 2) {
//      backgroundcolor = Color(0xff7c1919);
//    }
    //
    //Text Color
    //
    if (textnumber == 0) {
      textcolor = Colors.blueGrey;
    }
    if (textnumber == 1) {
      textcolor = const Color(0xff52416e);
    }
    if (textnumber == 2) {
      textcolor = const Color(0xff74a476);
    }

    return ReusableCard(
      settingTitle: 'Personalization',
      content: Column(children: [
        Row(children: [
          const Expanded(
              child: SizedBox(
            height: 20,
            child: Text('Accent Color'),
          )),
          SizedBox(
            height: 40,
            child: DropdownButton<Color>(
              alignment: Alignment.centerRight,
              icon: Container(
                child: const Icon(Icons.arrow_drop_down),
                alignment: Alignment.centerRight,
              ),
              //what the value of the dropdownbutton is
              value: dropdownValueAccent1,
              //uses the list accentcolorList as the items in the dropdownbutton
              items:
                  accentcolorList.map<DropdownMenuItem<Color>>((Color value) {
                return DropdownMenuItem<Color>(
                  value: value,
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 15.0,
                    width: 70.0,
                    color: value,
                  ),
                );
              }).toList(),
              onChanged: (Color? value) {
                setState(() {
                  dropdownValueAccent1 = value!;
                  //changes the value of accentnumber which can be used to change the UI

                  ref.read(personalizationProvider).setAccentColor(value);
                });
              },
            ),
          ),
        ]),
        Row(
          children: [
            Expanded(
              child: Container(child: Text('Accent Color 2')),
            ),
            Container(
              height: 40,
              child: DropdownButton(
                value: dropdownValueAccent2,
                items: accentcolor2List
                    .map<DropdownMenuItem<Widget>>((Widget value) {
                  return DropdownMenuItem<Widget>(
                    value: value,
                    child: value,
                  );
                }).toList(),
                onChanged: (Widget? value) {
                  setState(() {
                    dropdownValueAccent2 = value!;
                    accent2number =
                        accentcolor2List.indexOf(dropdownValueAccent2);
                    print('Accent2 $accent2number');
                  });
                },
              ),
            )
          ],
        ),
        Row(
          children: [
            const Expanded(
              child: Text('Background Color'),
            ),
            SizedBox(
                height: 40,
                child: DropdownButton(
                  value: dropdownValueBackground,
                  items: backgroundcolorList
                      .map<DropdownMenuItem<Widget>>((Widget value) {
                    return DropdownMenuItem<Widget>(
                      value: value,
                      child: value,
                    );
                  }).toList(),
                  onChanged: (Widget? value) {
                    setState(() {
                      dropdownValueBackground = value!;
                      BackgroundColorCalculator(
                          backgroundnumber: backgroundcolorList
                              .indexOf(dropdownValueBackground));
                      //backgroundnumber =
                      //    backgroundcolorList.indexOf(dropdownValueBackground);
                      //print('Background $backgroundnumber');
                    });
                  },
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: Text('Text Color'),
              ),
            ),
            Container(
              height: 40,
              child: DropdownButton(
                value: dropdownValueText,
                items:
                    textcolorList.map<DropdownMenuItem<Widget>>((Widget value) {
                  return DropdownMenuItem<Widget>(
                    value: value,
                    child: value,
                  );
                }).toList(),
                onChanged: (Widget? value) {
                  setState(() {
                    dropdownValueText = value!;
                    textnumber = textcolorList.indexOf(dropdownValueText);
                    print('Text $textnumber');
                  });
                },
              ),
            ),
          ],
        ),
        Container(
          child: Text('$accentnumber'),
          color: accentcolor,
          width: 70.0,
        ),
        Container(
          child: Text('$accent2number'),
          color: accent2color,
          width: 70.0,
        ),
        Container(
          //child: Text('$backgroundnumber'),
          //color: backgroundcolor,
          width: 70.0,
        ),
        Container(
          child: Text('$textnumber'),
          color: textcolor,
          width: 70.0,
        ),
      ]),
    );
  }
}
