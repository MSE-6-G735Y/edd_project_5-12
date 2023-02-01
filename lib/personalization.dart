//import 'package:eddproject/backgroundcolor.dart';
import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reusablecard.dart';
//import 'backgroundcolor.dart';

//
//Text Color
//
List<Color> textcolorList = <Color>[
  Colors.blueGrey,
  const Color(0xff52416e),
  const Color(0xff74a476),
];
Color dropdownValueText = textcolorList.first;
//
//Background Color
//
List<Color> backgroundcolorList = <Color>[
  Colors.white,
  const Color(0xffd7d8dc),
  const Color(0xff7c1919),
];
Color dropdownValueBackground = backgroundcolorList.first;
//
//Accent Color 2
//
List<Color> accentcolor2List = <Color>[
  Colors.indigo,
  Colors.purple,
  const Color(0x73635e5e),
];
Color dropdownValueAccent2 = accentcolor2List.first;
//
//Accent Color
//
List<Color> accentcolorList = <Color>[
  Colors.green,
  Colors.orange,
  Colors.red,
];

Color dropdownValueAccent1 = accentcolorList.first;

//int accentnumber = 0;
//int accent2number = 0;
//int backgroundnumber = 0;
//int textnumber = 0;

//Color accentcolor = Colors.green;
//Color accent2color = Colors.indigo;
//Color backgroundcolor = Colors.white;
//Color textcolor = Colors.blueGrey;
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
//    if (accentnumber == 0) {
//      accentcolor = Colors.green;
//    }
//    if (accentnumber == 1) {
//      accentcolor = Colors.orange;
//    }
//    if (accentnumber == 2) {
//      accentcolor = Colors.red;
//    }
    //
    //Accent Color 2
    //
//    if (accent2number == 0) {
//     accent2color = Colors.indigo;
//    }
//    if (accent2number == 1) {
//      accent2color = Colors.purple;
//    }
//    if (accent2number == 2) {
//      accent2color = const Color(0x73635e5e);
//    }
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
//    if (textnumber == 0) {
//      textcolor = Colors.blueGrey;
//    }
//    if (textnumber == 1) {
//      textcolor = const Color(0xff52416e);
//    }
//    if (textnumber == 2) {
//      textcolor = const Color(0xff74a476);
//    }

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
                    .map<DropdownMenuItem<Color>>((Color value) {
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
                    dropdownValueAccent2 = value!;
                    ref.read(personalizationProvider).setAccent2Color(value);
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
                      .map<DropdownMenuItem<Color>>((Color value) {
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
                      dropdownValueBackground = value!;
                      ref
                          .read(personalizationProvider)
                          .setBackgroundColor(value);
                      //BackgroundColorCalculator(
                      //backgroundnumber: backgroundcolorList
                      //.indexOf(dropdownValueBackground));
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
                    textcolorList.map<DropdownMenuItem<Color>>((Color value) {
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
                    dropdownValueText = value!;
                    ref.read(personalizationProvider).setTextColor(value);
                  });
                },
              ),
            ),
          ],
        ),
        //Container(
        //  child: Text('$accentnumber'),
        //  color: accentcolor,
        //  width: 70.0,
        //),
        //Container(
        //  child: Text('$accent2number'),
        //  color: accent2color,
        //  width: 70.0,
        //),
        //Container(
        //child: Text('$backgroundnumber'),
        //color: backgroundcolor,
        //width: 70.0,
        //),
        //Container(
        //  child: Text('$textnumber'),
        //  color: textcolor,
        //  width: 70.0,
        //),
      ]),
    );
  }
}
