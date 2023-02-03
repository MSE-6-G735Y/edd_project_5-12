import 'package:flutter/material.dart';

class PersonalizationProvider extends ChangeNotifier {
  //listing all the variables that will affect something outside of the personalization file
  Color accentColor;
  Color accent2Color;
  Color backgroundColor;
  Color textColor;
  //gives each variable a default value because they needs it.
  PersonalizationProvider({
    this.accentColor = Colors.blue,
    this.accent2Color = Colors.grey,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
  });

  void setAccentColor(Color newColor) {
    accentColor = newColor;
    //Tells all the parts of the app using this variable that something has changed
    notifyListeners();
  }

  void setAccent2Color(Color newColor) {
    accent2Color = newColor;
    notifyListeners();
  }

  void setBackgroundColor(Color newColor) {
    backgroundColor = newColor;
    notifyListeners();
  }

  void setTextColor(Color newColor) {
    textColor = newColor;
    notifyListeners();
  }
}
