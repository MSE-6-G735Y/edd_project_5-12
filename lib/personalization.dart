import 'package:eddproject/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'reusablecard.dart';

//import 'backgroundcolor.dart';
//
//
//
//
//Changing the first color requires you to change the value of its
//corresponding variable in personalization_provider
//
//Text Color
//
List<Color> textcolorList = <Color>[
  Colors.black,
  Colors.grey.shade500,
  Colors.green.shade700,
];
Color dropdownValueText = textcolorList.first;
//
//Background Color
//
List<Color> backgroundcolorList = <Color>[
  Colors.white,
  Colors.grey.shade700,
  Colors.red.shade100,
];
Color dropdownValueBackground = backgroundcolorList.first;
//
//Accent Color 2
//
List<Color> accentcolor2List = <Color>[
  Colors.grey,
  Colors.purple,
  Colors.grey.shade800,
];
Color dropdownValueAccent2 = accentcolor2List.first;
//
//Accent Color
//
List<Color> accentcolorList = <Color>[
  Colors.blue,
  Colors.orange,
  Colors.red,
];

Color dropdownValueAccent1 = accentcolorList.first;

class Personalization extends ConsumerStatefulWidget {
  const Personalization({Key? key}) : super(key: key);

  @override
  ConsumerState<Personalization> createState() => PersonalizationState();
}

class PersonalizationState extends ConsumerState<Personalization> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      settingTitle: 'Personalization',
      content: Column(children: [
        Row(children: [
          Expanded(
              child: SizedBox(
            height: 20,
            child: Text(
              'Accent Color',
              style: TextStyle(
                  color: ref.watch(personalizationProvider).textColor),
            ),
          )),
          SizedBox(
            height: 40,
            child: DropdownButton<Color>(
              alignment: Alignment.centerRight,
              icon: Container(
                child: Icon(Icons.arrow_drop_down,
                    color: ref.watch(personalizationProvider).accent2Color),
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
              child: Container(
                  child: Text(
                'Accent Color 2',
                style: TextStyle(
                    color: ref.watch(personalizationProvider).textColor),
              )),
            ),
            Container(
              height: 40,
              child: DropdownButton(
                icon: Container(
                  child: Icon(Icons.arrow_drop_down,
                      color: ref.watch(personalizationProvider).accent2Color),
                ),
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
            Expanded(
              child: Text(
                'Background Color',
                style: TextStyle(
                    color: ref.watch(personalizationProvider).textColor),
              ),
            ),
            SizedBox(
                height: 40,
                child: DropdownButton(
                  icon: Container(
                    child: Icon(Icons.arrow_drop_down,
                        color: ref.watch(personalizationProvider).accent2Color),
                  ),
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
                    });
                  },
                )),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'Text Color',
                  style: TextStyle(
                      color: ref.watch(personalizationProvider).textColor),
                ),
              ),
            ),
            Container(
              height: 40,
              child: DropdownButton(
                icon: Container(
                  child: Icon(Icons.arrow_drop_down,
                      color: ref.watch(personalizationProvider).accent2Color),
                ),
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
      ]),
    );
  }
}
