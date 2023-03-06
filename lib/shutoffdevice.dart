import 'package:flutter/material.dart';
import 'main.dart';
import 'reusablecard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'providers.dart';

TextEditingController sundayHr = TextEditingController();
TextEditingController sundayMin = TextEditingController();
TextEditingController mondayHr = TextEditingController();
TextEditingController mondayMin = TextEditingController();
TextEditingController tuesdayHr = TextEditingController();
TextEditingController tuesdayMin = TextEditingController();
TextEditingController wednesdayHr = TextEditingController();
TextEditingController wednesdayMin = TextEditingController();
TextEditingController thurdayHr = TextEditingController();
TextEditingController thursdayMin = TextEditingController();
TextEditingController fridayHr = TextEditingController();
TextEditingController fridayMin = TextEditingController();
TextEditingController saturdayHr = TextEditingController();
TextEditingController saturdayMin = TextEditingController();

class ShutOffDevice extends ConsumerStatefulWidget {
  const ShutOffDevice({Key? key}) : super(key: key);

  @override
  ConsumerState<ShutOffDevice> createState() => ShutOffDeviceState();
}

class ShutOffDeviceState extends ConsumerState<ShutOffDevice> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
        settingTitle: 'Shut Off Device',
        content: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Sunday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: sundayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: sundayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            ),
            //
            //
            //
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Monday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: mondayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: mondayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            ),
            //
            //
            //
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Tuesday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: tuesdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: tuesdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            ),
            //
            //
            //
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Wednesday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: wednesdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: wednesdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            ),
            //
            //
            //
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Thursday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: thurdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: thursdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            ),
            //
            //
            //
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Friday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: fridayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: fridayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            ),
            //
            //
            //
            Row(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Saturday'))),
                const SizedBox(
                  child: ToggleSwitch(),
                  width: 60,
                  //color: Colors.amber,
                ),
                SizedBox(
                  width: 50,
                  height: 20,
                  child: Row(children: [
                    SizedBox(
                        width: 17,
                        height: 10,
                        //
                        //
                        //
                        child: TextField(
                          controller: saturdayHr,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0123456789]'))
                          ],
                          style: TextStyle(
                              color: ref
                                  .watch(personalizationProvider)
                                  .textColor),
                          cursorColor:
                              ref.watch(personalizationProvider).textColor,
                        )),
                    //
                    //
                    //
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: const Text(':')),
                    SizedBox(
                      //
                      //
                      //
                      child: TextField(
                        controller: saturdayMin,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0123456789]'))
                        ],
                        style: TextStyle(
                            color:
                                ref.watch(personalizationProvider).textColor),
                        cursorColor:
                            ref.watch(personalizationProvider).textColor,
                      ),
                      //
                      //
                      //
                      width: 25,
                      height: 10,
                    )
                  ]),
                  //color: Colors.pink,
                )
              ],
            )
          ],
        ));
  }
}

class ShutOffDeviceTile extends StatelessWidget {
  ShutOffDeviceTile({super.key, required this.day});

  String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child:
                Container(alignment: Alignment.centerLeft, child: Text(day))),
        const SizedBox(
          child: ToggleSwitch(),
          width: 60,
          //color: Colors.amber,
        ),
        SizedBox(
          width: 50,
          height: 20,
          child: Row(children: [
            const SizedBox(width: 17, height: 10, child: TextField()),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 1), child: const Text(':')),
            const SizedBox(
              child: TextField(),
              width: 25,
              height: 10,
            )
          ]),
          //color: Colors.pink,
        )
      ],
    );
  }
}
